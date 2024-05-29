#!/bin/bash

# Get average CPU usage
avg_cpu=$(mpstat 1 1 | awk '/Average/ {print "avg_usr=" $3 " avg_sys=" $5 " avg_iowait=" $6 " avg_idle=" $12}')

# Get per-core CPU usage
per_core_cpu=$(mpstat -P ALL 1 1 | awk '/Average/ && $2 ~ /[0-9]/ {print "core_" $2 "_usr=" $3 " core_" $2 "_sys=" $5 " core_" $2 "_iowait=" $6 " core_" $2 "_idle=" $12}')

# Combine average and per-core CPU usage into one log entry
log_entry="timestamp=$(date '+%Y-%m-%d %H:%M:%S') $avg_cpu $per_core_cpu"

# Print the log entry (or append to a log file)
echo $log_entry
