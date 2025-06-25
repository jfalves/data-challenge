## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Steps to Run

### With Docker Compose

```
docker-compose up
```

To run in detached mode:

```
docker-compose up -d
```

To stop the services:

```
docker-compose down
```

### Without Docker Compose

Build the Docker image:

```
docker build -t data_challenge-jupyter .
```

Run the Docker container:

```
docker run -d \
--name jupyter_notebook \
-p 8888:8888 \
-v $(pwd)/notebooks:/home/jovyan/work \
data_challenge-jupyter \
start-notebook.sh --NotebookApp.token='' --NotebookApp.password=''
```
