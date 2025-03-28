from setuptools import setup

package_name = 'my_node'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='you',
    maintainer_email='you@example.com',
    description='ROS2 test node',
    license='MIT',
    entry_points={
        'console_scripts': [
            'ros2_node = my_node.ros2_node:main',
        ],
    },
)

