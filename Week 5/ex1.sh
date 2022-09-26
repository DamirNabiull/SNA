#!/bin/bash
echo "Username: $USER"
echo "Home Directory: $HOME"
echo "Shell: $SHELL"
echo "Hostname: $HOSTNAME"
ipaddress=$(ip -o -4 addr list wlp8s0 | awk '{print $4}' | cut -d/ -f1)
echo "IP address: $ipaddress"