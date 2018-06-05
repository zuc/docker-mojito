#!/bin/sh

set -e
cd /opt/mojito/

# Env vars interpolation
envsubst < application.properties.dist > application.properties
rm application.properties.dist

# Go!
exec java -XX:MaxPermSize=128m -Xmx1024m -jar webapp.jar
