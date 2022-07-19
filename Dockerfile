FROM agolo.azurecr.io/ops/maven15 as mvn
COPY . /postgresqlplayground
WORKDIR /postgresqlplayground
RUN ./gradlew bootJar

FROM openjdk:15-jdk-alpine
EXPOSE 8080
EXPOSE 8081
RUN apk update
RUN apk --no-cache add ca-certificates wget busybox-extras
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk
RUN adduser -D agolo
USER agolo

COPY --from=mvn /postgresplayground/build/libs/postgresql-*.jar app.jar
ENV JAVA_OPTS="-XX:MaxRAMPercentage=75"
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar
