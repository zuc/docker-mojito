#!/bin/sh

set -e
cd /opt/mojito/

# Env vars interpolation
envsubst < application.properties.dist > application.properties
rm application.properties.dist

# Go!
exec java -jar cli.jar $@
