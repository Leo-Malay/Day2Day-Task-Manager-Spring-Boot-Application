FROM maven:4.0.0-rc-4-ibm-semeru-25-noble AS mvn

WORKDIR /day2day

COPY pom.xml .
COPY src ./src

RUN mvn dependency:go-offline
RUN mvn package

COPY target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]