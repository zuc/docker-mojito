FROM java:8-jre
LABEL maintainer="michele@zuccala.com"

ENV MOJITO_VERSION 0.83

RUN apt-get update && \
    apt-get install -y curl gettext-base

RUN mkdir -p /opt/mojito/bin && \
    mkdir -p /opt/mojito/conf && \
    curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-cli-${MOJITO_VERSION}.jar > /opt/mojito/bin/cli.jar && \
    curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-webapp-${MOJITO_VERSION}.jar > /opt/mojito/bin/webapp.jar

COPY application.properties.dist /opt/mojito/conf/
COPY mojito-webapp-launcher.sh /opt/

EXPOSE 8080

CMD ["/opt/mojito-webapp-launcher.sh"]
