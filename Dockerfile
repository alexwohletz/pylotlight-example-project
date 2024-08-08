FROM apache/airflow:2.7.2-python3.10
ARG AIRFLOW_VERSION=2.7.2
ADD airflow-requirements.txt .
ADD dbt-requirements.txt .
# Install dbt per astro docs
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir --no-user -r dbt-requirements.txt && deactivate
RUN pip install apache-airflow==$AIRFLOW_VERSION -r airflow-requirements.txt