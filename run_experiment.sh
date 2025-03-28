#!/bin/bash

set -e

echo "Checking if ROS1 image exists..."
if ! docker image inspect ros1-param-test > /dev/null 2>&1; then
    echo "Building ROS1 Docker image..."
    docker build -t ros1-param-test -f Dockerfiles/Dockerfile.ros1 .
else
    echo "ROS1 image already built. Skipping."
fi

echo ""
echo "Checking if ROS2 image exists..."
if ! docker image inspect ros2-param-test > /dev/null 2>&1; then
    echo "Building ROS2 Docker image..."
    docker build -t ros2-param-test -f Dockerfiles/Dockerfile.ros2 .
else
    echo "ROS2 image already built. Skipping."
fi

echo ""
echo "Running ROS1 test..."
docker run --rm ros1-param-test

echo ""
echo "Running ROS2 test..."
docker run --rm ros2-param-test
