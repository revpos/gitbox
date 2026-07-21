# Variables
IMAGE_NAME = gitbox:v2
CONTAINER_NAME = gitbox
HOSTNAME = gitbox

.PHONY: help build run start stop clean shell

# Default target
help:
	@echo "Available commands:"
	@echo "  make build  - Build the Podman image"
	@echo "  make run    - Create and enter a new container"
	@echo "  make start  - Re-enter a stopped container (preserves your git repos)"
	@echo "  make stop   - Stop the running container"
	@echo "  make shell  - Open a second terminal window into the running container"
	@echo "  make clean  - Destroy the container and image"

build:
	podman build -t $(IMAGE_NAME) .

run:
	podman run -it --hostname $(HOSTNAME) --name $(CONTAINER_NAME) $(IMAGE_NAME)

start:
	podman start -i $(CONTAINER_NAME)

stop:
	podman stop $(CONTAINER_NAME)

shell:
	podman exec -it $(CONTAINER_NAME) bash

clean:
	podman rm -f $(CONTAINER_NAME) || true
	podman rmi $(IMAGE_NAME) || true
