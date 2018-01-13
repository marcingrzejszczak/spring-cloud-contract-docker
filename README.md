## Spring Cloud Contract Docker ##

This repo contains a docker image that can generate and execute contract tests using [Spring Cloud Contract](https://cloud.spring.io/spring-cloud-contract/).

### Short intro to JARs

TODO: Describe `groupId`, `artifactId`, `jar` and JAR storage (e.g. Artifactory)

### How it works

Contracts need to be mounted under `/contracts` folder

### Setup Properties

- `PROJECT_GROUP` - group id
- `PROJECT_VERSION` - version
- `PROJECT_NAME` - artifact id
- `REPO_WITH_BINARIES_URL` - e.g. Artifactory URL
- `REPO_WITH_BINARIES_USERNAME` - optional username
- `REPO_WITH_BINARIES_PASSWORD` - optional password

### Test Properties

- `APPLICATION_BASE_URL` - url against which tests should be executed. 
Remember that it has to be accessible from the Docker container 
- `APPLICATION_USERNAME` - optional username for basic authentication
- `APPLICATION_PASSWORD` - optional password for basic authentication