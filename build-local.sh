#!/bin/bash

# Local build script for s3-app and sns-app using buildx

echo "Building s3-app..."
docker buildx build --platform linux/amd64 -t grp1-s3-app:latest ./s3-app

echo "Building sqs-app..."
docker buildx build --platform linux/amd64 -t grp1-sqs-app:latest ./sqs-app

echo "Build complete!"
echo "Images created:"
echo "- grp1-s3-app:latest"
echo "- grp1-sqs-app:latest"

# Optional: List images
docker images | grep grp1