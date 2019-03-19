#!/bin/sh

set -e
cd /opt/mojito

# Env vars interpolation (if not already processed)
if [ -f application.properties.dist ]; then
    envsubst < application.properties.dist > application.properties
    rm application.properties.dist
fi

# Go!
mkdir -p /opt/mojito/workdir && cd /opt/mojito/workdir
exec java -jar /opt/mojito/cli.jar $@ --spring.config.location=/opt/mojito/application.properties
