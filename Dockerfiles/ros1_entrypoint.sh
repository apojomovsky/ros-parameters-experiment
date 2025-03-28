#!/bin/bash

set -e

echo "Starting ROS1 experiment..."

# Source environment
source /opt/ros/noetic/setup.bash
source /ros1_ws/devel/setup.bash

# Launch roscore in background
roscore &
ROSCORE_PID=$!
sleep 2

# Load parameters
echo "Loading parameters..."
rosparam load /shared_params.yaml

# Show tree
echo "Parameter tree:"
rosparam get /

# Run node
echo "Running node..."
rosrun my_node ros1_node.py

# Shutdown
kill $ROSCORE_PID
