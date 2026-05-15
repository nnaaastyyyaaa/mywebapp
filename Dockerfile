FROM --platform=linux/arm64  node:24 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npx prisma generate

FROM --platform=linux/arm64  node:24

WORKDIR /app

COPY --from=builder /app /app

ENV DOCKER=true

EXPOSE 5200

CMD ["node", "server.js"]