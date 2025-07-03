FROM debian:bullseye as base

RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/duckdb/duckdb/releases/download/v1.3.1/duckdb_cli-linux-arm64.gz \
    && echo "b454f1561389adf302af2f5ddea9bc4917ca540d2c356b17061f8c987320999d duckdb_cli-linux-arm64.gz" | sha256sum -c \
    && gunzip -c duckdb_cli-linux-arm64.gz > /usr/local/bin/duckdb \
    && chmod +x /usr/local/bin/duckdb \
    && rm duckdb_cli-linux-arm64.gz

FROM jupyter/base-notebook:python-3.9

# Copy the DuckDB binary from the base image
COPY --from=base /usr/local/bin/duckdb /usr/local/bin/duckdb

# Install Python dependencies
COPY --chown=jovyan docker-context/requirements.txt docker-context/requirements.txt
RUN pip install --no-cache-dir -r docker-context/requirements.txt

# Generate duckdb database
COPY --chown=jovyan docker-context/sql/db_init.sql docker-context/sql/db_init.sql
RUN duckdb /tmp/database.duckdb < docker-context/sql/db_init.sql

# Use current python packages for the kernel
RUN python -m ipykernel install --name "datachallengekernel" --display-name "Data Challenge Kernel" --user

# Copy the notebook and other necessary files
COPY docker-context/sample.json /tmp/sample.json

#Clean up
RUN rm -rf docker-context/
