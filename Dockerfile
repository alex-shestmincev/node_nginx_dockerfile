FROM node:12.16.1-alpine

WORKDIR /api

COPY package.json /api/package.json

RUN set -x

# ========== Nginx section start ==========
RUN apk add --update nginx
RUN mkdir -p /run/nginx

COPY ./config/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./config/nginx/mime.types /etc/nginx/conf/mime.types
# ========== Nginx section end ==========

RUN npm install --loglevel=warn

COPY ./entrypoint.sh /api/entrypoint.sh

COPY ./src /api/src
COPY ./dumps /api/dumps

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 80
