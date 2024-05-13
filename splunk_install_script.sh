#!/bin/bash

# Define Splunk Universal Forwarder download URL
SPLUNK_URL="https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=9.1.2&product=universalforwarder&filename=splunkforwarder-9.1.2-9849e60b9e5b-Linux-x86_64.tgz&wget=true"

# Define installation directory
INSTALL_DIR="/opt/splunkforwarder"

# Download Splunk Universal Forwarder
echo "Downloading Splunk Universal Forwarder..."
wget -O splunkforwarder.tgz "$SPLUNK_URL"

# Extract Splunk Universal Forwarder
echo "Extracting Splunk Universal Forwarder..."
sudo tar -xzf splunkforwarder.tgz -C /opt

# Rename the extracted directory
sudo mv /opt/splunkforwarder-9.1.2-9849e60b9e5b-Linux-x86_64 "$INSTALL_DIR"

# Start Splunk Universal Forwarder
echo "Starting Splunk Universal Forwarder..."
sudo "$INSTALL_DIR/bin/splunk" start --accept-license --answer-yes

# Enable Splunk Universal Forwarder to start on boot
echo "Enabling Splunk Universal Forwarder to start on boot..."
sudo "$INSTALL_DIR/bin/splunk" enable boot-start

# Clean up downloaded files
echo "Cleaning up downloaded files..."
rm splunkforwarder.tgz

echo "Splunk Universal Forwarder installation completed."
