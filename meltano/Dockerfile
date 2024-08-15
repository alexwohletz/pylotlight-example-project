# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV MELTANO_HOME /meltano

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
 
RUN pip install meltano
# Copy Files
RUN mkdir /meltano
COPY . /meltano 
WORKDIR /meltano/pylolight
RUN pip install -U pip>=23.3
RUN pip install -r requirements.txt

RUN meltano install
RUN meltano config meltano set ff.plugin_locks_required true
# Install plugins from meltano.yml


# Set the default command to run when starting the container
# CMD ["meltano", "ui"]