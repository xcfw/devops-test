# Kubernetes and docker

1. Install and run minikube if you don't have it already.
If you have docker-desktop you just enable minikube in the settings.
Now create a dockerfile for the app in this repo.
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

3. Create a simple kubernetes deployment file for the name and tag that you've just build and forward port 4000.
Make a curl post and get requests to the sha-service app, that you just deployed and see if it works.
