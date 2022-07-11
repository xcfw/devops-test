# Kubernetes and docker

1. Let's create a `Dockerfile` for the app in this repo.
`sha-service` is a simple app, that will accept hex values with http post and print it out with http get requests.

<details><summary>Description of the sha-service</summary>
<p>

**Routes:**

 - *POST:* http(s)://$(whatever_name)/api/v1/sha_manager/**:branch**/**:source**
 - *GET:*  http(s)://$(whatever_name)/api/v1/sha_manager/**:branch**/**:source**

**Examples:**

 - *POST:* `https://sha-service.com/api/v1/sha_manager/main/src:sha-123456` . **note**: in **src:sha-123456** the **:** (colon symbol) which divides **source** and **sha** is neccessary, given that service can properly parse and save **sha** related to **branch** and **source**.

 - *GET* `https://sha-service.com/api/v1/sha_manager/main/src`. **note:** on **GET** you just specify **branch** and **source**, if something is stored under that path, you will get the result, in this case the result will be **sha-123456**.

</p>
</details>

2. Build, name and tag docker image for the app. The name should be: `ghcr.io/powr/sha-service`, add whatever tag you want.
You may need `default-libmysqlclient-dev wget ruby-mysql2` packets from debian in order to start the app in docker.

You also need to pass `RAILS_ENV` as a build time argument to be equal to `development` when building the image in order to use local database.

3. Let's bring an up and working mysql db installation:

```shell
docker run --name shadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123qwe -e MYSQL_DATABASE=shadb mysql:latest
```
Now start `sha-service` container and check if it's able to communicate with DB. For some installations you might need to perform

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' shad
```

and copy it's output IP to `config/database.yml` host section. Don't forget to revert this change back because we'll need default configuration for the next step.

4. You'll need a working minikube installation that works with your docker for this step, or if you have docker-desktop just enable kubernetes in the settings.
Now create a simple kubernetes deployment for the `sha-service` docker container that you've just built and also forward port 3000.
Make a curl post and get requests to the sha-service app, that you just deployed and see if it works.
