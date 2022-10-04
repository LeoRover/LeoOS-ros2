#!/bin/bash -e

mkdir -p -m 755 "${ROOTFS_DIR}/etc/ros/urdf"
mkdir -p -m 755 "${ROOTFS_DIR}/usr/lib/ros"

install -v -m 644 files/setup.bash "${ROOTFS_DIR}/etc/ros/"
install -v -m 644 files/robot.launch.xml "${ROOTFS_DIR}/etc/ros/"
install -v -m 644 files/robot.urdf.xacro "${ROOTFS_DIR}/etc/ros/urdf/"
install -v -m 644 files/systemd/* "${ROOTFS_DIR}/etc/systemd/user/"
install -v -m 755 files/scripts/* "${ROOTFS_DIR}/usr/lib/ros/"

on_chroot << EOF
chown ${FIRST_USER_NAME}:${FIRST_USER_NAME} -R "/etc/ros"
chown root:root -R "/etc/ros/rosdep"
su - ${FIRST_USER_NAME} -c "systemctl --user enable ros-nodes"
su - ${FIRST_USER_NAME} -c "systemctl --user enable uros-agent"
su - ${FIRST_USER_NAME} -c "systemctl --user enable ros.target"
EOF

if ! grep -q "source /etc/ros/setup.bash" "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.bashrc"; then
    echo -e "\nsource /etc/ros/setup.bash" >> "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.bashrc"
fi

# Enable lingering for default user
mkdir -p -m 755 "${ROOTFS_DIR}/var/lib/systemd/linger"
touch "${ROOTFS_DIR}/var/lib/systemd/linger/${FIRST_USER_NAME}"
