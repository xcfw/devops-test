# Docker and Compose

### 1. Let's edit a `Dockerfile` so that we could run the Sha-Service app in the docker environment.
First short reference of the ruby structure: 
- ruby uses packages that called `gems` and they are listed in a `Gemfile` and it has lock version
- use this knowledge to find out which ruby version you'll need to write a proper Dockerfile.
`shaservice` itself is a simple HTTP API service, that will accept text values with http post and print it out with http get requests. It is used to store docker image tags in our deployment process in POWR.

<details><summary>Description of the ShaService</summary>
<p>

#### Info about ShaService

This simple API service is used to store and review the history of the tags of the docker images in POWR. 
It saves **tag** string via **POST** request and returns it on demand via **GET**.

**Routes:**

 - *POST:* http(s)://(whatever_domain)/api/v1/**:repo**/**:branch**/**:source**
 - *GET:* http(s)://(whatever_domain)/api/v1/**:repo**/**:branch**/**:source**

**Examples:**

 - *POST:* `https://localhost:3000/api/v1/leandro/devops/submission:v1` . **note**: in **submission:v1** the **:** (colon symbol) which divides **source** and **tag** is neccessary, given that service can properly parse and save the **tag** related to **branch** and **source**.
 
 - *GET* `https://localhost:3000/api/v1/leandro/devops/submission`. **note:** on **GET** you just specify **branch** and **source**, if something is stored under that path, you will get the result, in this case the result will be **v1**.

</p>
</details>

### 2. Build, name and tag docker image for the app. The name could be: `ghcr.io/xcfw/devops-test/leandro/shaservice`, add whatever tag you want.
You may need `default-libmysqlclient-dev curl ruby-mysql2` packets from debian in order to start the app in docker.

### 3. To make `shaservice` work you'll also need working mysql db installation:

```shell
docker run --name shadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123qwe -e MYSQL_DATABASE=shadb mysql:latest
```

### 4. Using the knowledge from the previous steps please edit the `docker compose file` to make `shadb` and `shaservice` run together. 
Please note that you need to pass `RAILS_ENV`, `DB_HOST`, and `RAILS_MASTER_KEY` as a run time arguments when running `shaservice`, in order to use local database `RAILS_ENV` should equal `development`.


### 5. Make a curl post and get requests to the sha-service app localhost address, that you just deployed and see if it works.
