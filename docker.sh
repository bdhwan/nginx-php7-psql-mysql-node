#!/bin/bash
docker build  --no-cache  --tag bdhwan/nginx-php7-psql-mysql-node:0.0.1 .
docker push bdhwan/nginx-php7-psql-mysql-node:0.0.1