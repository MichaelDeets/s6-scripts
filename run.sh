#!/bin/sh
rm -rf /etc/s6-linux-init/compiled /etc/s6-linux-init/current /etc/s6-rc/compiled
s6-rc-compile /etc/s6-linux-init/compiled /etc/s6-linux-init/src
mkdir -p /etc/s6-rc/compiled
ln -sf /etc/s6-linux-init/compiled /etc/s6-rc/compiled/current
s6-linux-init-maker -G "/sbin/agetty tty12 38400 linux" -1 "/etc/s6-linux-init/current"
cp -rf /etc/s6-linux-init/current/bin/* /usr/local/sbin/
