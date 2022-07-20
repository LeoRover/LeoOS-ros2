#!/bin/bash -e

# Install the ROS2 apt package archive
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o "${ROOTFS_DIR}/usr/share/keyrings/ros-archive-keyring.gpg"
install -v -m 644 files/ros2.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

on_chroot "apt update"
