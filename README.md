# nginx-php7-psql
우분투 16.04

<p>설치항목</p>   

```
mysql-client, git, php7.0, php7.0-curl, php7.0-mbstring, nginx postgresql-client php php7.0-fpm php7.0-pgsql php7.0-mysql php7.0-gd php7.0-xml php7.0-intl phpunit 
```



<p>local 실행시 </p> 


```
docker run --rm -ti -p 80:80 --mount type=bind,source="$(pwd)",target=/var/www/html -e DOCKER_DB_HOST=dbhost -e DOCKER_DB_USER=test bdhwan/nginx-php7-psql-mysql-node:0.3.3
```

<p>환경변수 사용방법 </p>

```
<!DOCTYPE html>
<html><head></head><body>
DOCKER_ENV: 
<?php
echo 'DOCKER_A ' .$_SERVER["DOCKER_A"] . '!';
?>
```



<p>현재폴더를 root로 실행됨 </p>   


<p> /data 폴더에 persistent 데이터가 저장됨</p>

```
version: '3.5'
services:
  php-service:
    hostname: 'php-service-hostname'
    image: bdhwan/nginx-php7-psql:0.2.5
    restart: always
    logging:
      driver: "json-file"
      options:
        max-size: "10MB"
        max-file: "10"
    environment:
    - GIT_URL=git_url
    - DOCKER_MASTER_HOST=php_param 
    volumes:
    - /data/somefolder:/data
    - /etc/localtime:/etc/localtime:ro      
    ports:
    - "7001:80"
```


<p>start.sh 파일이 있을 경우 시작 시 실행됨 </p>



