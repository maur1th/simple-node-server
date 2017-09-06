FROM node:8 AS builder
COPY . /app
WORKDIR /app
RUN yarn install --ignore-optional --pure-lockfile --production=true

FROM node:8-slim
COPY --from=builder /app /app
WORKDIR /app
ENV PORT=8080
EXPOSE $PORT
CMD node index.js
