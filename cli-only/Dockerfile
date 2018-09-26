FROM java:8-jre
LABEL maintainer="michele@zuccala.com"

ENV MOJITO_VERSION 0.90

RUN apt-get update && \
    apt-get install -y curl gettext-base

RUN mkdir -p /opt/mojito && \
    curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-cli-${MOJITO_VERSION}.jar > /opt/mojito/cli.jar

COPY application.properties.dist /opt/mojito/
COPY mojito-cli-entrypoint.sh /opt/

ENTRYPOINT ["/opt/mojito-cli-entrypoint.sh"]
