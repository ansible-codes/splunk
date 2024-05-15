#!/bin/bash

# Define the directory where log files are stored
LOG_DIR="/app/splunk/logs"

# Check if the directory exists
if [ -d "$LOG_DIR" ]; then
    # Change to the log directory
    cd "$LOG_DIR"
    
    # Truncate all log files in the directory
    for file in *.log; do
        truncate -s 0 "$file"
    done

    echo "All log files in $LOG_DIR have been truncated."
else
    echo "Log directory $LOG_DIR does not exist."
    exit 1
fi
