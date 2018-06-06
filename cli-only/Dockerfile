FROM java:8-jre
LABEL maintainer="michele@zuccala.com"

ENV MOJITO_VERSION 0.83

RUN apt-get update && \
    apt-get install -y curl gettext-base

RUN mkdir -p /opt/mojito/bin && \
    mkdir -p /opt/mojito/conf && \
    curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-cli-${MOJITO_VERSION}.jar > /opt/mojito/bin/cli.jar

COPY application.properties.dist /opt/mojito/conf/
COPY mojito-cli-entrypoint.sh /opt/

ENTRYPOINT ["/opt/mojito-cli-entrypoint.sh"]
