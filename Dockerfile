FROM jupyter/base-notebook:python-3.9

USER root

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

COPY docker-context/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN python -m ipykernel install --name "sqlchallengekernel" --display-name "SQL Challenge Kernel" --user

COPY docker-context/database.db /tmp/database.db

COPY docker-context/sample.json /tmp/sample.json
