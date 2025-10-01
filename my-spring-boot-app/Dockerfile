# Stage 1: Build the Spring Boot JAR
FROM gradle:8.8-jdk17 AS build

WORKDIR /app

# Copy Gradle build files
COPY build.gradle settings.gradle ./
COPY src ./src


RUN gradle clean bootJar --no-daemon



FROM eclipse-temurin:17-jre-alpine

WORKDIR /app


COPY --from=build /app/build/libs/*.jar app.jar


EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
