FROM node:24 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npx prisma generate

FROM node:24

WORKDIR /app

RUN apt-get update && apt-get install -y postgresql-client

COPY --from=builder /app /app

COPY scripts/migrate-container.sh /migrate-container.sh
RUN chmod +x /migrate-container.sh

ENV DOCKER=true

EXPOSE 5200

CMD ["/migrate-container.sh"]