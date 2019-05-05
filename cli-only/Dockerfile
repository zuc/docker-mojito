FROM tutum/curl:alpine

ENV MOJITO_VERSION 0.97

RUN curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-cli-${MOJITO_VERSION}.jar > /tmp/cli.jar

FROM java:8-jre

LABEL maintainer="michele@zuccala.com"

COPY --from=0 /tmp/cli.jar /opt/mojito/cli.jar

RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY application.properties.dist /opt/mojito/
COPY mojito-cli-entrypoint.sh /opt/

ENTRYPOINT ["/opt/mojito-cli-entrypoint.sh"]
