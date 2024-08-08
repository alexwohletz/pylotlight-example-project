build-airflow:
	docker-compose -f docker-compose.yaml up -d airflow-init

run-airflow:
	docker-compose -f docker-compose.yaml up -d