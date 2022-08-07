# syntax=docker/dockerfile:1
FROM nginx:alpine
COPY /webpage/. /usr/share/nginx/html