## Prerequisites
Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- A compatible GPU and CUDA drivers installed on your host machine
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) for Docker
- A working Django application with the repository containing the `Dockerfile` and `docker-compose.yml`

## How to Run Dockerfile

### Step 1: Build the Docker Image

```bash
docker build -t django-ai-gpu .
```

### Step 2: Run the Docker Container

```bash
docker run --gpus all -p 8071:8071 django-ai-gpu
```
This command will start the container with GPU support and map port 8000 of the container to port 8000 on your host.

## How to Start Container Using Compose File

### Step 1: Run Docker Compose

This repository includes a `docker-compose.yml` file for easy setup. Run the following command to build and start the containers:

```bash
docker-compose up --build
```

This will build the Docker image and start the container with GPU support.

### Step 2: Access the Django Application

Once the container is running, you can access the Django application at `http://localhost:8071`.


## File Overview

### Dockerfile

The `Dockerfile` sets up the environment for running the Django application with GPU support.

### docker-compose.yml

The `docker-compose.yml` file defines the services, including the Django application and any dependencies, and sets up GPU support.

## Customization

To customize the Django application, modify the `Dockerfile` and `docker-compose.yml` as needed.

## Contributing

Contributions are welcome! Please fork this repository and submit pull requests.

## Contact
If you have any questions or need further assistance, please create an issue in this repository.
