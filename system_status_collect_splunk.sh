#!/bin/bash

# Variables
LOG_FILE="/var/log/splunk/system_status.log"

# Get system uptime
uptime_info=$(uptime -p)

# Get list of running services
running_services=$(systemctl list-units --type=service --state=active | grep -v UNIT)

# Get process IDs (PIDs) of running services
pids=$(ps -eo pid,comm)

# Get timestamp
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Write data to log file in Splunk-friendly format
echo "$timestamp uptime='$uptime_info' running_services='${running_services//[$'\n\r']/ }' pids='${pids//[$'\n\r']/ }'" >> "$LOG_FILE"
