#!/bin/bash
set -e

export $(grep -v '^#' /etc/mywebapp/.env | xargs)

cd /opt/mywebapp

./node_modules/.bin/prisma migrate deploy
./node_modules/.bin/prisma generate