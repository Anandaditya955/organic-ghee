# Stage 1: Install dependencies
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .


# Stage 2: Run application
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 6000

CMD ["node", "src/app.js"]
