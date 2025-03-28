cmake_minimum_required(VERSION 3.5)
project(my_node)

# Find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclpy REQUIRED)

install(
  PROGRAMS
    my_node/ros2_node.py
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()

