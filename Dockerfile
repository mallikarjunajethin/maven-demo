# Use official maven/Java image to create a build environment.
FROM maven:3.6.3-jdk-8 AS build

# Copy source code to the container.
COPY ./src /usr/src/app/src
COPY pom.xml /usr/src/app

# Set the working directory.
WORKDIR /usr/src/app

# Package the application.
RUN mvn package

# Create a minimal Java runtime image.
FROM openjdk:8-jre-alpine

# Copy the JAR file from the build stage to the runtime image.
COPY --from=build /usr/src/app/target/maven-demo-1.0-SNAPSHOT.jar /usr/app/maven-demo-1.0-SNAPSHOT.jar

# Set the entry point to the application.
ENTRYPOINT ["java", "-jar", "/usr/app/maven-demo-1.0-SNAPSHOT.jar"]
