AWS_REGION = eu-north-1
AWS_ACCOUNT_ID = 482497089777
ECR_URL = $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com

.PHONY: build run stop push

# Docker image and container names
IMAGE_NAME = qr-code-api
CONTAINER_NAME = qr-code-api-container

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the container
run:
	docker run -d --name $(CONTAINER_NAME) \
		--env-file .aws \
		-p 8000:8000 \
		$(IMAGE_NAME)

# Stop and remove the container
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Show container logs
logs:
	docker logs -f $(CONTAINER_NAME)

# Push the image to AWS ECR
push:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(ECR_URL)
	docker tag $(IMAGE_NAME):latest $(ECR_URL)/$(IMAGE_NAME):latest
	docker push $(ECR_URL)/$(IMAGE_NAME):latest