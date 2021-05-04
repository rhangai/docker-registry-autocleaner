#!/bin/sh

set -e

registry garbage-collect /etc/docker/registry/config.yml || echo "Could not garbage collect"
exec registry serve /etc/docker/registry/config.yml