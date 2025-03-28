#!/usr/bin/env python3

import rospy


def main():
    rospy.init_node("my_node")
    full_param_name = "/my_node/ros__parameters/my_param"
    value = rospy.get_param(full_param_name, "not found")
    rospy.loginfo(f"[ROS1] Loaded parameter: {full_param_name} = {value}")


if __name__ == "__main__":
    main()
