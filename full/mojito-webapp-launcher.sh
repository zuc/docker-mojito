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
exec java -XX:MaxPermSize=128m -Xmx1024m -jar /opt/mojito/webapp.jar --spring.config.location=/opt/mojito/application.properties
