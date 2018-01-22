FROM anapsix/alpine-java:8_jdk

MAINTAINER Marcin Grzejszczak <mgrzejszczak@pivotal.io>

COPY . /spring-cloud-contract/
WORKDIR /spring-cloud-contract/
# Let's download all the deps
RUN ./gradlew clean build || echo "That's expected. We just wanted to download the deps"
CMD ["./build.sh"]
