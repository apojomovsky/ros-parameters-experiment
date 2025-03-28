#!/usr/bin/env python3

import rclpy
from rclpy.node import Node


class MyNode(Node):
    def __init__(self):
        super().__init__("my_node")
        my_param = self.declare_parameter("my_param", 0).value
        full_name = f"{self.get_fully_qualified_name()}.my_param"
        self.get_logger().info(f"[ROS2] Loaded parameter: {full_name} = {my_param}")


def main(args=None):
    rclpy.init(args=args)
    node = MyNode()

    # Only print the declared or loaded parameters, skip system ones
    for name in node._parameters:
        param = node.get_parameter(name)
        print(f"[ROS2] {name} = {param.value}")

    rclpy.shutdown()


if __name__ == "__main__":
    main()
