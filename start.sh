#!/bin/bash

# Define the name for your Docker Compose service
SERVICE_NAME="program"

# Check if the Docker Compose service is running
if [[ "$(docker compose ps -q $SERVICE_NAME /dev/null)" == "" ]]; then
  echo "Docker Compose service '$SERVICE_NAME' not running. Starting it..."
  
  # Start the Docker Compose service
  docker compose up -d
  
  # Check if the service started successfully
  if [ $? -ne 0 ]; then
    echo "Error: Failed to start Docker Compose service '$SERVICE_NAME'."
    exit 1
  fi
fi

# Attach to the Docker Compose service
docker compose exec $SERVICE_NAME python main.py
