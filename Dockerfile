FROM alpine:3.7
RUN apk add openjdk8
RUN apk add maven

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mvn install
ADD ./target/example.smallest-0.0.1-SNAPSHOT.war example.smallest-0.0.1-SNAPSHOT.war

EXPOSE 8080
ENTRYPOINT ["java","-jar","target/example.smallest-0.0.1-SNAPSHOT.war"]
