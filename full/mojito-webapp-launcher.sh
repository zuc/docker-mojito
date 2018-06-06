#!/bin/sh

set -e
cd /opt/mojito/conf/

# Env vars interpolation
envsubst < application.properties.dist > application.properties
rm application.properties.dist

# Go!
cd /opt/mojito/bin/
exec java -XX:MaxPermSize=128m -Xmx1024m -jar webapp.jar --spring.config.location=/opt/mojito/conf/application.properties
