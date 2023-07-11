FROM ubuntu:20.04

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get -y install nginx

RUN apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=FREE/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt
RUN mv localhost.dev.crt etc/ssl/certs/
RUN mv localhost.dev.key etc/ssl/private/
RUN chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

WORKDIR /etc/nginx/conf.d

COPY ./config/default.conf .

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]