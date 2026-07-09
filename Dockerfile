FROM eclipse-temurin:21-jdk

WORKDIR /usr/app

COPY target/*.jar app.jar

EXPOSE 5000

ENTRYPOINT ["java","-jar","app.jar"]
