#!/bin/bash

# Get total and used memory
mem_info=$(free -m | awk 'NR==2{printf "mem_total=%s mem_used=%s mem_free=%s mem_shared=%s mem_buff_cache=%s mem_available=%s", $2, $3, $4, $5, $6, $7}')

# Calculate memory usage percentage
mem_used=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')

# Create a log entry
log_entry="timestamp=$(date '+%Y-%m-%d %H:%M:%S') mem_used_percent=$mem_used $mem_info"

# Print the log entry (or append to a log file)
echo $log_entry
