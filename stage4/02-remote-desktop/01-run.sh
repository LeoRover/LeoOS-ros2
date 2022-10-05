#!/bin/bash -e

install -v -m 644 files/systemd/x0vncserver.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot "systemctl enable x0vncserver"
