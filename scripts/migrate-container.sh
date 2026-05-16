#!/bin/bash
set -e

echo "Starting migration script..."

cd /app
echo "Setting up database connection..."
until pg_isready -h db -U user -d mywebapp; do
  echo "Postgres is unavailable - sleeping"
  sleep 2
done

npx prisma generate
npx prisma migrate deploy


echo "Starting Node server..."
exec node server.js