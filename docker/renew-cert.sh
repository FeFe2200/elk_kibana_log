#!/bin/bash

#Docker Compose로 실행 중인 Nginx 컨테이너를 중지
docker stop nginx
docker rm nginx
docker rmi docker_nginx

# certbot을 사용하여 인증서를 갱신
sudo certbot renew

rm -rf ./nginx/secrets/fullchain.pem
rm -rf ./nginx/secrets/privkey.pem
sudo cp /etc/letsencrypt/live/api.42gg.kr/fullchain.pem  ./nginx/secrets/fullchain.pem
sudo cp /etc/letsencrypt/live/api.42gg.kr/privkey.pem  ./nginx/secrets/privkey.pem
sudo chown ec2-user:ec2-user ./nginx/secrets/fullchain.pem
sudo chown ec2-user:ec2-user ./nginx/secrets/privkey.pem

# Docker Compose로 Nginx 컨테이너를 다시 실행
docker-compose up -d nginx
