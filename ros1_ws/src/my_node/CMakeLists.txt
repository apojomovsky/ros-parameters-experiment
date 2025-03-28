cmake_minimum_required(VERSION 3.0.2)
project(my_node)

find_package(catkin REQUIRED COMPONENTS
  rospy
)

catkin_package()

catkin_install_python(PROGRAMS
  scripts/ros1_node.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

