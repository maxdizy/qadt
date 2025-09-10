## How to build a ROS 2 node using MAVROS
### 1. Create a ROS package and add your code to the src directory
```
    ros2 pkg create <node_name> --build-type ament_cmake --dependencies <list dependancies>
```
example:
```
    ros2 pkg create offboard_control --build-type ament_cmake --dependencies rclcpp mavros_msgs sensor_msgs geometry_msgs
```

### 2. Modify CMakeLists.txt to build your node
Add the following under the last find_package command:
```
    add_executable(<executable_name> src/<code_file_name>.cxx)
    ament_target_dependencies(<executable_name> <list dependancies>)
    install(TARGETS
    <executable_name>
    DESTINATION lib/${PROJECT_NAME})
```
example:
```
    add_executable(offboard_control_node src/offboard_control_node.cxx)
    ament_target_dependencies(offboard_control_node rclcpp mavros_msgs sensor_msgs geometry_msgs)
    install(TARGETS
    offboard_control_node
    DESTINATION lib/${PROJECT_NAME})
```

### 3. Build your workspace
Build the workspace targeting your new package:
```
    colcon build --packages-select <node_name>
```
example:
```
    colcon build --packages-select offboard_control
```

### 4. Source and run your new node
```
    source ~/.bashrc
    ros2 run <node_name> <executable_name>
```
example:
```
    source ~/.bashrc
    ros2 run offboard_control offboard_control_node
```
