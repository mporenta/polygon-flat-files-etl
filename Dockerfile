# Extend the official Airflow image
ARG AIRFLOW_IMAGE=apache/airflow:3.0.1
FROM ${AIRFLOW_IMAGE}

USER root

# Install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Ensure your helper modules are importable
ENV PYTHONPATH="/opt/airflow/scripts:${PYTHONPATH}"

# Create directory for Parquet staging & SQLite
RUN mkdir -p /opt/airflow/data/staging

USER airflow
