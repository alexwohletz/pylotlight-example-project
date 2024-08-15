.PHONY: meltano

build-airflow:
	docker-compose -f docker-compose.yaml up -d airflow-init

run-airflow:
	docker-compose -f docker-compose.yaml up -d

meltano: 
	docker-compose up -d meltano_db
	docker exec meltano_db sleep 5
	docker-compose up -d meltano
	docker exec -ti meltano_container /bin/bash
