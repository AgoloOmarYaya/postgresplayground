FROM agolo.azurecr.io/ops/maven15 as mvn
COPY . /postgresplayground
WORKDIR /postgresplayground
RUN ./gradlew bootJar

FROM openjdk:15-jdk-alpine
EXPOSE 8080
EXPOSE 8081
RUN adduser -D agolo
USER agolo

COPY --from=mvn /postgresplayground/build/libs/postgres-*.jar app.jar
ENV JAVA_OPTS="-XX:MaxRAMPercentage=75"
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar
