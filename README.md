# Devops task

# How to use SHA-Service

This service saves **SHA** string given via **POST** request and returns it on demand via **GET**.

**Routes:**

 - *POST:* http(s)://(whatever_domain)/api/v1/sha_manager/**:branch**/**:source**
 - *GET:* http(s)://(whatever_domain)/api/v1/sha_manager/**:branch**/**:source**

**Examples:**

 - *POST:* `https://sha-service.com/api/v1/sha_manager/main/src:sha-123456` . **note**: in **src:sha-123456** the **:** (colon symbol) which divides **source** and **sha** is neccessary, given that service can properly parse and save **sha** related to **branch** and **source**.
 
 - *GET* `https://sha-service.com/api/v1/sha_manager/main/src`. **note:** on **GET** you just specify **branch** and **source**, if something is stored under that path, you will get the result, in this case the result will be **sha-123456**.


