# First stage to build the application
FROM maven:3.5.4-jdk-11-slim AS build-env
ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package

# run unit test
FROM build-env as test
RUN mvn test 

# build runtime image
FROM openjdk:11-jre-slim as final

EXPOSE 8080

ENV SQL_USER="YourUserName" \
SQL_PASSWORD="changeme" \
SQL_SERVER="changeme.database.windows.net" \
SQL_DBNAME="mydrivingDB"

# Add the application's jar to the container
COPY --from=build-env target/swagger-spring-1.0.0.jar user-java.jar
ADD https://github.com/microsoft/ApplicationInsights-Java/releases/download/3.0.0/applicationinsights-agent-3.0.0.jar applicationinsights-agent-3.0.0.jar 

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-javaagent:applicationinsights-agent-3.0.0.jar","-jar","/user-java.jar"]