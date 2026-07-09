FROM eclipse-temurin:21-jdk

WORKDIR /usr/app

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
