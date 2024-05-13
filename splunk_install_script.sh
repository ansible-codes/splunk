#!/bin/bash

# Define the path to the Splunk Universal Forwarder package
FORWARDER_PACKAGE="/tmp/splunkforwarder-9.1.2_install/splunkforwarder-9.1.2-9849e60b9e5b-Linux-x86_64.tgz"

# Define installation directory
INSTALL_DIR="/opt/splunkforwarder"

# Stop the existing Splunk Universal Forwarder
echo "Stopping Splunk Universal Forwarder..."
sudo "$INSTALL_DIR/bin/splunk" stop

# Backup the existing installation directory
echo "Backing up existing installation directory..."
sudo mv "$INSTALL_DIR" "$INSTALL_DIR.bak"

# Extract the new version
echo "Extracting Splunk Universal Forwarder 9.1.2..."
sudo tar -xzf "$FORWARDER_PACKAGE" -C /opt

# Rename the extracted directory
sudo mv "/opt/splunkforwarder-9.1.2-9849e60b9e5b" "$INSTALL_DIR"

# Start the new version
echo "Starting Splunk Universal Forwarder 9.1.2..."
sudo "$INSTALL_DIR/bin/splunk" start --accept-license --answer-yes

echo "Splunk Universal Forwarder upgrade to version 9.1.2 completed."
