FROM jiwhiz/spring-boot-docker-mysql
MAINTAINER Wojciech Sasiela

EXPOSE 8080

ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=demo
ENV MYSQL_USER=demo_user
ENV MYSQL_PASSWORD=demo_pass

RUN apt-get update -q -q
