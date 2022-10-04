source /opt/ros/humble/setup.bash

# Path to the launch file to start.
LAUNCH_FILE="/etc/ros/robot.launch.xml"

# Arguments passed to ros2 launch command
LAUNCH_ARGS=""

# Arguments passed to Micro-ROS agent
UROS_AGENT_ARGS="serial -D /dev/serial0 -b 460800"

### ROS Environment Variables
#export ROS_DOMAIN_ID=10
#export ROS_NAMESPACE="leo1"
#export ROS_LOCALHOST_ONLY=1
export RCUTILS_COLORIZED_OUTPUT=1
