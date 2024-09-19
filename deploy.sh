#!/bin/bash

# Set Docker Hub username and repository
DOCKER_HUB_USERNAME="pavanvarikolu"
SERVICE_REGISTRY_IMAGE="$DOCKER_HUB_USERNAME/service-registry:latest"
QUESTION_SERVICE_IMAGE="$DOCKER_HUB_USERNAME/question-service:latest"
QUIZ_SERVICE_IMAGE="$DOCKER_HUB_USERNAME/quiz-service:latest"

# Build Docker images using docker-compose
docker-compose build

# Tag images
docker tag quizmicroservices-service-registry:latest $SERVICE_REGISTRY_IMAGE
docker tag quizmicroservices-question-service:latest $QUESTION_SERVICE_IMAGE
docker tag quizmicroservices-quiz-service:latest $QUIZ_SERVICE_IMAGE

# Push images to Docker Hub
docker push $SERVICE_REGISTRY_IMAGE
docker push $QUESTION_SERVICE_IMAGE
docker push $QUIZ_SERVICE_IMAGE

# Optional: Remove local images if desired
# docker rmi quizmicroservices-service-registry:latest $SERVICE_REGISTRY_IMAGE
# docker rmi quizmicroservices-question-service:latest $QUESTION_SERVICE_IMAGE
# docker rmi quizmicroservices-quiz-service:latest $QUIZ_SERVICE_IMAGE

echo "Docker images have been built, tagged, and pushed to Docker Hub successfully."
