.PHONY: build run stop logs

# Docker image and container names
IMAGE_NAME = qr-code-frontend-dev
CONTAINER_NAME = qr-code-frontend-dev

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the container
run:
	docker run -d --name $(CONTAINER_NAME) \
        -p 3000:3000 \
        -v $(PWD):/app \
        -v /app/node_modules \
        -e NEXT_PUBLIC_API_URL=http://localhost:8000 \
        $(IMAGE_NAME)

# Stop and remove the container
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Show container logs
logs:
	docker logs -f $(CONTAINER_NAME)