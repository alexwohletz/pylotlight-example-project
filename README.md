**Project Name:** pylotlight-example-project

**Description:**
A demonstration of Apache Airflow, dbt, Cosmos, and duckDb as a modern analytics pipeline.  Primary focus of this repository is to have a platform that emits log messages for the Pylot Light data platform observability project.

**Features:**

* Fully containerized in docker-compose.yml
* Runs dbt models in Airflow using the dbt-Cosmos project from Astronomer.io

**Requirements:**

* Docker
* Python
* Docker-Compose

**Installation:**

1. Clone the repository using `git clone https://github.com/alexwohletz/pylotlight-example-project`
2. Run the project using `make build-airflow` and then `make run-airflow`

**Usage:**

* Navigate to localhost:8080 and enter username: 'airflow' password: 'airflow'.
* Click the play button on the dag to run it and see the results.
