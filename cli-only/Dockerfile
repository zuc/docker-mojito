FROM tutum/curl:alpine

ENV MOJITO_VERSION 0.105

RUN curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-cli-${MOJITO_VERSION}.jar > /tmp/cli.jar

FROM openjdk:8-jre as production

LABEL maintainer="michele@zuccala.com"

COPY --from=0 /tmp/cli.jar /opt/mojito/cli.jar

COPY application.properties /opt/mojito/

ENV SPRING_CONFIG_LOCATION "/opt/mojito/application.properties"

ENTRYPOINT [ "java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Xmx1024m", "-jar", "/opt/mojito/cli.jar" ]
