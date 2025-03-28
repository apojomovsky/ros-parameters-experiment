#!/bin/bash

set -e

echo "Starting ROS2 experiment..."

# Source environment
source /opt/ros/jazzy/setup.bash
source /ros2_ws/install/setup.bash

# Show parameter YAML file
echo "shared_params.yaml content:"
cat /shared_params.yaml

# Run node with YAML param file
echo "Running node..."
ros2 run my_node ros2_node --ros-args --params-file /shared_params.yaml
