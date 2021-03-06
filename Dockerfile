#
# Build stage
#
FROM maven:3.5.4-jdk-8-alpine AS build
COPY src /helloworldWebapp05/src/
COPY pom.xml /helloworldWebapp05
RUN mvn -f /helloworldWebapp05/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
ADD target/demo.war /usr/local/lib/demo.war
EXPOSE 8080
ENTRYPOINT ["java","-war","/usr/local/lib/demo.war"]
