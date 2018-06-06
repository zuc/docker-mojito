#!/bin/sh

set -e
cd /opt/mojito/conf/

# Env vars interpolation
envsubst < application.properties.dist > application.properties
rm application.properties.dist

# Go!
cd /opt/mojito/bin/
exec java -jar cli.jar --spring.config.location=/opt/mojito/conf/application.properties $@
