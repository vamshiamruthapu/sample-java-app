FROM openjdk:17-alpine
WORKDIR /app
COPY target/accessing-data-mysql-complete-0.0.1-SNAPSHOT.jar ./app.jar
COPY mysql-connector-java-8.0.30.jar .
CMD ["java", "-jar", "app.jar"]