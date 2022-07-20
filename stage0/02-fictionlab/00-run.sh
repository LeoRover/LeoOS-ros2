#!/bin/bash -e

# Install the fictionlab apt package archive
curl -sSL http://files.fictionlab.pl/repo/fictionlab.gpg -o "${ROOTFS_DIR}/usr/share/keyrings/fictionlab-archive-keyring.gpg"
install -v -m 644 files/fictionlab.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

# Copy resolver configuration file from host
rm -v -f "${ROOTFS_DIR}/etc/resolv.conf"
cp -v /etc/resolv.conf "${ROOTFS_DIR}/etc/resolv.conf"

on_chroot "apt update"
