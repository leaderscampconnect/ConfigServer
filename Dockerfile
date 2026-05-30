FROM eclipse-temurin:17
COPY target/ConfigServer-0.0.1-SNAPSHOT.jar configserver.jar
EXPOSE 8099

ENTRYPOINT ["java", "-jar" , "configserver.jar"]