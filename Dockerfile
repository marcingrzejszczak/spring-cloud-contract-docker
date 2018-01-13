FROM anapsix/alpine-java:8

MAINTAINER Marcin Grzejszczak <mgrzejszczak@pivotal.io>

COPY . /usr/share/spring-cloud-contract-docker/
WORKDIR /usr/share/spring-cloud-contract-docker/
# Let's download all the deps
RUN ./gradlew clean build || echo "That's expected. We just wanted to download the deps"
ENTRYPOINT ["./gradlew", "clean", "build", "--stacktrace"]