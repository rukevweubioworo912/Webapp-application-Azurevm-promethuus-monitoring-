#!/bin/bash

# Create project root
mkdir -p java-gradle-app
cd java-gradle-app || exit

# Gradle wrapper files and gradle folder (you may have these already)
mkdir -p gradle
mkdir -p gradle/wrapper

# Create gradle.properties
cat <<EOL > gradle.properties
org.gradle.jvmargs=-Xmx1024m
EOL

# Create settings.gradle
cat <<EOL > settings.gradle
rootProject.name = 'java-gradle-app'
EOL

# Create build.gradle
cat <<EOL > build.gradle
plugins {
    id 'application'
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation libs.junit.jupiter
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
    implementation libs.guava
}

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(17)
    }
}

application {
    mainClass = 'org.example.App'
}

tasks.named('test') {
    useJUnitPlatform()
}
EOL

# Create libs.versions.toml
mkdir -p gradle
cat <<EOL > gradle/libs.versions.toml
[versions]
junit = "5.10.0"
guava = "32.1.2-jre"

[libraries]
junit-jupiter = { module = "org.junit.jupiter:junit-jupiter", version.ref = "junit" }
guava = { module = "com.google.guava:guava", version.ref = "guava" }
EOL

# Create .gitignore
cat <<EOL > .gitignore
/build/
.gradle/
out/
*.class
*.log
EOL

# Create .gitattributes
cat <<EOL > .gitattributes
* text=auto
EOL

# Create app folder structure
mkdir -p app/src/main/java/org/example
mkdir -p app/src/main/resources/static
mkdir -p app/src/test/java/org/example

# Create App.java
cat <<EOL > app/src/main/java/org/example/App.java
package org.example;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello, Java Gradle App!");
    }
}
EOL

# Create AppTest.java
cat <<EOL > app/src/test/java/org/example/AppTest.java
package org.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class AppTest {

    @Test
    public void testApp() {
        assertTrue(true, "Simple test passed");
    }
}
EOL

# Create index.html
cat <<EOL > app/src/main/resources/static/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Java Gradle App</title>
</head>
<body>
    <h1>Welcome to Java Gradle App!</h1>
</body>
</html>
EOL

echo "✅ Java Gradle project structure created successfully!"
