FROM tutum/curl:alpine as build

ENV MOJITO_VERSION 0.96

RUN curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-cli-${MOJITO_VERSION}.jar    > /tmp/cli.jar && \
    curl -L https://github.com/box/mojito/releases/download/v${MOJITO_VERSION}/mojito-webapp-${MOJITO_VERSION}.jar > /tmp/webapp.jar


FROM java:8-jre as production

LABEL maintainer="michele@zuccala.com"

COPY --from=build /tmp/cli.jar /opt/mojito/cli.jar
COPY --from=build /tmp/cli.jar /opt/mojito/webapp.jar

RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY application.properties.dist /opt/mojito/
COPY mojito-webapp-launcher.sh /opt/

EXPOSE 8080

CMD ["/opt/mojito-webapp-launcher.sh"]
