dev:
	docker-compose -p timemanager -f docker-compose-dev.yaml up --build -d
log:
	docker-compose -p timemanager log
stop:
	docker-compose -p timemanager 