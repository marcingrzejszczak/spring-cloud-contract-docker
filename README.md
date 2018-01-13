## Spring Cloud Contract Docker ##

This repo contains a docker image that can generate and execute contract tests using [Spring Cloud Contract](https://cloud.spring.io/spring-cloud-contract/).

## Short intro to JARs

TODO: Describe `groupId`, `artifactId`, `jar` and JAR storage (e.g. Artifactory)

## How it works

Contracts need to be mounted under `/contracts` folder

Output available under `/spring-cloud-contract/build` folder.

### Setup Env Vars

- `PROJECT_GROUP` - group id
- `PROJECT_VERSION` - version
- `PROJECT_NAME` - artifact id
- `REPO_WITH_BINARIES_URL` - e.g. Artifactory URL
- `REPO_WITH_BINARIES_USERNAME` - optional username
- `REPO_WITH_BINARIES_PASSWORD` - optional password
- `PUBLISH_ARTIFACTS` - if set to `true` then will publish artifact to binary storage

### Test Env Vars

- `APPLICATION_BASE_URL` - url against which tests should be executed. 
Remember that it has to be accessible from the Docker container 
- `APPLICATION_USERNAME` - optional username for basic authentication
- `APPLICATION_PASSWORD` - optional password for basic authentication

## Example of usage

Build locally a Docker image (step required until the image gets published)

```bash
$ git clone https://github.com/marcingrzejszczak/spring-cloud-contract-docker/
$ cd spring-cloud-contract-docker
$ docker build -t spring-cloud-contract-docker .
```

Clone a nodejs application (in this case it has contracts defined)

```bash
$ git clone https://github.com/marcingrzejszczak/bookstore/
$ cd bookstore
$ git checkout sc-contract
```

Run the mongodb docker (in real life scenario you would just
run the nodejs application with mocked services)

```bash
$ ./gradlew startDBContainer
```

Run the nodejs application (it will start on port `3000`)

```bash
$ node app
```

Run the contract tests

```bash
$ docker run -e "APPLICATION_BASE_URL=http://192.168.1.100:3000" -v `pwd`/src/test/resources/contracts/:/contracts -d spring-cloud-contract-docker:latest
```

If you want to publish the stubs to e.g. Artifactory just execute

```bash
$ docker run -e "APPLICATION_BASE_URL=http://192.168.1.100:3000" -e "PUBLISH_ARTIFACTS=true" -e "REPO_WITH_BINARIES_URL=http://your.ip.to.artifactory" -e "REPO_WITH_BINARIES_USERNAME=foo" -e "REPO_WITH_BINARIES_USERNAME=bar" -v `pwd`/src/test/resources/contracts/:/contracts -d spring-cloud-contract-docker:latest
``` 