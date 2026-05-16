#!/bin/bash
set -e

export "$(grep -v '^#' /etc/mywebapp/.env | xargs)"

cd /opt/mywebapp

echo "Waiting for database..."

until pg_isready -h db -U user; do
  sleep 2
done

echo "Database is ready"

./node_modules/.bin/prisma migrate deploy
./node_modules/.bin/prisma generate

exec node server.js