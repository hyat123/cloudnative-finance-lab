FROM node:20-alpine AS builder
WORKDIR /app
COPY html/ ./html/
RUN mkdir -p /app/dist && cp -r /app/html/* /app/dist/
FROM nginx:1.25-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
LABEL maintainer="CloudNative Finance Security Lab"
LABEL version="1.0"
