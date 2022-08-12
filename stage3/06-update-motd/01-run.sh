#!/bin/bash -e

rm -rf "${ROOTFS_DIR}/etc/update-motd.d/"*

install -v -m 755 files/* "${ROOTFS_DIR}/etc/update-motd.d/"

on_chroot <<EOF
systemctl disable ua-timer.timer
systemctl disable update-notifier-download.timer
systemctl disable update-notifier-motd.timer
systemctl disable ua-reboot-cmds.service
systemctl disable ubuntu-advantage.service
EOF