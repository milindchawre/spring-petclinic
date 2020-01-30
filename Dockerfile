FROM maven:3.6-jdk-8-slim AS build
COPY . /usr/src/app/
WORKDIR /usr/src/app/
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8-slim
WORKDIR /
COPY --from=build /usr/src/app/target/*.jar /spring-petclinic.jar
CMD java -jar spring-petclinic.jar
