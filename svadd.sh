#!/usr/bin/bash

# Check if anything was provided if blank give usage
if [ -z "$1" ]; then
echo "Usage: $0 <service-name>"
exit 1
fi

# Set Service Name
SERVICE_NAME="$1"

# See if service is in /etc/sv/
if [ ! -d "/etc/sv/$SERVICE_NAME" ]; then
    echo "Service '$SERVICE_NAME' does not exist in /etc/sv!"
exit 1
fi

# Create the symlink if it does exist in /etc/sv
ln -s "/etc/sv/$SERVICE_NAME "/var/service/"

if [ $? -eq 0 ]; then
    echo "Service '$SERVICE_NAME' added successfully!"
else
    echo "Adding service '$SERVICE_NAME' failed."
exit 1
fi
