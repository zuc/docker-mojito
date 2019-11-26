FROM tutum/curl:alpine as build

ENV MOJITO_VERSION 0.105

RUN curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-cli-${MOJITO_VERSION}.jar    > /tmp/cli.jar && \
    curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-webapp-${MOJITO_VERSION}.jar > /tmp/webapp.jar

FROM openjdk:8-jre as production

LABEL maintainer="michele@zuccala.com"

COPY --from=build /tmp/cli.jar /opt/mojito/cli.jar
COPY --from=build /tmp/webapp.jar /opt/mojito/webapp.jar

COPY application.properties /opt/mojito/application.properties

ENV SPRING_CONFIG_LOCATION "/opt/mojito/application.properties"

EXPOSE 8080

CMD [ "java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Xmx1024m", "-jar", "/opt/mojito/webapp.jar" ]
