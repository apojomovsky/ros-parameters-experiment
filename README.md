# Shared ROS1/ROS2 Parameter YAML Experiment

This experiment demonstrates how to write a single YAML file that can be loaded and interpreted correctly under both ROS1 (Noetic) and ROS2 (Jazzy) using Docker containers and minimal example nodes.

## Objective

Can we write one YAML file that works seamlessly in both ROS1 and ROS2?

Yes — with a little structure awareness.

This project shows how to:

- Structure your YAML file using `ros__parameters`
- Load it correctly under both systems
- Extract and print parameters with full names in a consistent format
- Compare the output cleanly between ROS1 and ROS2

## Project Structure

```
experiment/
├── Dockerfiles/
│   ├── Dockerfile.ros1
│   ├── Dockerfile.ros2
│   ├── ros1_entrypoint.sh
│   └── ros2_entrypoint.sh
├── ros1_ws/           # ROS1 catkin workspace
│   └── src/my_node/
├── ros2_ws/           # ROS2 colcon workspace
│   └── src/my_node/
├── shared_params.yaml
└── run_experiment.sh
```

## How to Run

From the `experiment/` folder:

```
./run_experiment.sh
```

This will:

- Build Docker images for ROS1 and ROS2 (if needed)
- Run each container
- Load the shared YAML file
- Launch a node that reads the parameter
- Print the fully qualified parameter names and values

## Shared YAML File

```yaml
my_node:
  ros__parameters:
    my_param: 42
```

This structure is ROS2-native, but works in ROS1 if loaded at the root level using:

```
rosparam load shared_params.yaml
```

## Sample Output

```
[PARAM] ros__parameters/my_param = 42
```

This format is:

- Identical for both ROS1 and ROS2
- Stripped of system or default parameters
- Ideal for automated comparison or documentation

## Notes

- ROS1 base image: `ros:noetic`
- ROS2 base image: `ros:jazzy`
- Parameters are declared explicitly under `ros__parameters` in code
- Docker layers are cached to avoid unnecessary rebuilds

## Ideas for Extension

- Support nested parameters and arrays
- Auto-generate a comparison table
- Add YAML validation or schema enforcement
- Use Docker volumes to live-edit the YAML without rebuilds

## Author

Created as a minimal and reproducible experiment to explore the interoperability of parameter handling across ROS1 and ROS2.
