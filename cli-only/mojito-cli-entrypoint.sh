#!/bin/sh

set -e
cd /opt/mojito

# Env vars interpolation
envsubst < application.properties.dist > application.properties
rm application.properties.dist

# Go!
mkdir -p /opt/mojito/workdir && cd /opt/mojito/workdir
exec java -jar /opt/mojito/cli.jar $@
