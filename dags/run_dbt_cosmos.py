from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
import os,datetime
profile_config = ProfileConfig(
    profile_name="default",
    target_name="dev",
    profiles_yml_filepath=f"{os.environ['AIRFLOW_HOME']}/dbt/pylotlight/profiles.yml",
)

my_cosmos_dag = DbtDag(
    project_config=ProjectConfig(
        f"{os.environ['AIRFLOW_HOME']}/dbt/pylotlight",
        env_vars={"DBT_LOG_FORMAT_FILE": "json"}
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",
    ),
    # normal dag parameters
    schedule_interval="@daily",
    start_date=datetime.datetime(2021, 1, 1),
    catchup=False,
    dag_id="run_dbt_cosmos",
    default_args={"retries": 0},
)