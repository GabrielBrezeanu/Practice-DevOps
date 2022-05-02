jenkins-build:
	docker-compose -f docker-compose.yml build jenkins

jenkins-start:
	docker-compose -f docker-compose.yml up -d jenkins

jenkins-stop:
	docker-compose -f docker-compose.yml stop jenkins

demo-app-build:
	docker-compose -f docker-compose.yml build demo-app-python	

demo-app-start:
	docker-compose -f docker-compose.yml up -d --force-recreate demo-app-python

demo-app-push:
	docker-compose -f docker-compose.yml push demo-app-python

demo-app-stop:
	docker-compose -f docker-compose.yml stop demo-app-python

stop-all:
	docker-compose -f docker-compose.yml stop
