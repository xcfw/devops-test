# Docker and Compose

### 1. Let's edit a `Dockerfile` so that we could run the Sha-Service app in the docker environment.
First short reference of the ruby structure: 
- ruby uses packages that called `gems` and they are listed in a `Gemfile` and it has lock version
- use this knowledge to find out which ruby version you'll need to write a proper Dockerfile.
`sha-service` itself is a simple HTTP API service, that will accept text values with http post and print it out with http get requests. It is used to store docker image tags in our deployment process in POWR.

<details><summary>Description of the sha-service</summary>
<p>

#### Info about Sha-Service

This simple API service is used to store and review the history of the tags of the docker images in POWR. 
It saves **SHA** string via **POST** request and returns it on demand via **GET**.

**Routes:**

 - *POST:* http(s)://(whatever_domain)/api/v1/sha_manager/**:branch**/**:source**
 - *GET:* http(s)://(whatever_domain)/api/v1/sha_manager/**:branch**/**:source**

**Examples:**

 - *POST:* `https://sha-service.com/api/v1/sha_manager/main/src:sha-123456` . **note**: in **src:sha-123456** the **:** (colon symbol) which divides **source** and **sha** is neccessary, given that service can properly parse and save **sha** related to **branch** and **source**.
 
 - *GET* `https://sha-service.com/api/v1/sha_manager/main/src`. **note:** on **GET** you just specify **branch** and **source**, if something is stored under that path, you will get the result, in this case the result will be **sha-123456**.

</p>
</details>

### 2. Build, name and tag docker image for the app. The name should be: `ghcr.io/sha-service`, add whatever tag you want.
You may need `default-libmysqlclient-dev wget ruby-mysql2` packets from debian in order to start the app in docker.

You also need to pass `RAILS_ENV` as a build time argument to be equal to `development` when building the image in order to use local database.

### 3. To make sha-service work you'll need working mysql db installation:

```shell
docker run --name shadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123qwe -e MYSQL_DATABASE=shadb mysql:latest
```
Now start `sha-service` container and check if it's able to communicate with DB. For some installations you might need to perform

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' shadb
```

and copy it's output IP to `config/database.yml` host section. Don't forget to revert this change back because we'll need default configuration for the next step.

### 4. Now please edit the compose file of this repo to make mysqldb and sha-service run together. 

### 5. Make a curl post and get requests to the sha-service app localhost address, that you just deployed and see if it works.
