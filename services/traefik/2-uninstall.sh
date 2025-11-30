#!/usr/bin/env sh
set -e

NS=networking

helm uninstall traefik -n $NS
