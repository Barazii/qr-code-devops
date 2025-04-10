.PHONY: build run stop

# Docker image and container names
IMAGE_NAME = qr-code-api
CONTAINER_NAME = qr-code-api-container

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the container
run:
	docker run -d --name $(CONTAINER_NAME) \
		--env-file ../../.aws \
		-p 8000:8000 \
		$(IMAGE_NAME)

# Stop and remove the container
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Show container logs
logs:
	docker logs -f $(CONTAINER_NAME)