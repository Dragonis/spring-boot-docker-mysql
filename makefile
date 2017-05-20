build: 
	mvn clean package docker:build
mysql:
	docker run --name demo-mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=demo -e MYSQL_USER=demo_user -e MYSQL_PASSWORD=demo_pass -d mysql:5.6

run: 
	docker run -p 8080:8080 --name demo-app --link demo-mysql:mysql -d jiwhiz/spring-boot-docker-mysql

log: 
	docker logs demo-mysql
log2: 
	docker logs demo-app
stop1: 
	docker stop demo-app
stop2: 
	docker stop demo-mysql
remove1: 
	docker rm demo-app
remove2: 
	docker rm demo-mysql
up:
	make build
	make mysql
	make run
	# make log
	# make log2	
down:
	make stop1
	make stop2
	make remove1
	make remove2

delcon:
	# Delete all containers
	docker rm $(docker ps -a -q)
	# Delete all images
	docker rmi $(docker images -q)
