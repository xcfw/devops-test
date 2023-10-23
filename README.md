# Devops technical test

1. Fork this repo and clone the fork locally
2. Create a new branch called `submission/leandro-test` and then perform [this docker and compose test](docker-compose.md) in your branch
3. Commit your changes and push to your branch
4. Continue with the [*nix knowledge test](starnix.md)
5. Now create a pull request to the `upstream` repo's `leandro` branch

## Info about Sha-Service

This simple API service is used to store and review the history of the tags of the docker images in POWR. 
It saves **SHA** string via **POST** request and returns it on demand via **GET**.

**Routes:**

 - *POST:* http(s)://(whatever_domain)/api/v1/sha_manager/**:branch**/**:source**
 - *GET:* http(s)://(whatever_domain)/api/v1/sha_manager/**:branch**/**:source**

**Examples:**

 - *POST:* `https://sha-service.com/api/v1/sha_manager/main/src:sha-123456` . **note**: in **src:sha-123456** the **:** (colon symbol) which divides **source** and **sha** is neccessary, given that service can properly parse and save **sha** related to **branch** and **source**.
 
 - *GET* `https://sha-service.com/api/v1/sha_manager/main/src`. **note:** on **GET** you just specify **branch** and **source**, if something is stored under that path, you will get the result, in this case the result will be **sha-123456**.


