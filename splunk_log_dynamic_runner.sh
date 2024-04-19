#!/bin/bash

# Check if the command argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

# Command provided as argument
command_to_run="$1"

# Define the log file path
log_file="/app/splunk/script/splunk_log_dynamic.log"

# Run the command and append its output to the log file
{
  echo "Running command: $command_to_run"
  eval "$command_to_run"
  echo "Command executed successfully at $(date)"
} >> "$log_file" 2>&1
