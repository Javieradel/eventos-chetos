# Multi-stage build for Spring Boot application

# Stage 1: Build stage
FROM openjdk:17-jdk-slim AS build

# Install required tools
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy gradle wrapper and configuration files
COPY App/gradlew App/gradlew.bat ./
COPY App/gradle gradle/
COPY App/build.gradle App/settings.gradle ./

# Make gradlew executable
RUN chmod +x ./gradlew

# Copy source code
COPY App/src src/

# Build the application
RUN ./gradlew build -x test --no-daemon

# Stage 2: Runtime stage
FROM openjdk:17-jre-slim

# Create non-root user for security
RUN groupadd -r spring && useradd -r -g spring spring

# Set working directory
WORKDIR /app

# Copy the built JAR from build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Change ownership to spring user
RUN chown spring:spring app.jar

# Switch to non-root user
USER spring

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/actuator/health || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]