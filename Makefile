# Variables
IMAGE_NAME = gitbox-env
CONTAINER_NAME = gitbox
HOSTNAME = gitbox

.PHONY: help build run start stop clean shell

# Default target
help:
	@echo "Available commands:"
	@echo "  make build  - Build the Docker image"
	@echo "  make run    - Create and enter a new container"
	@echo "  make start  - Re-enter a stopped container (preserves your git repos)"
	@echo "  make stop   - Stop the running container"
	@echo "  make shell  - Open a second terminal window into the running container"
	@echo "  make clean  - Destroy the container and image"

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it --hostname $(HOSTNAME) --name $(CONTAINER_NAME) $(IMAGE_NAME)

start:
	docker start -i $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) bash

clean:
	docker rm -f $(CONTAINER_NAME) || true
	docker rmi $(IMAGE_NAME) || true
