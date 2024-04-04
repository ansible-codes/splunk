#!/bin/bash

# Collect CPU usage using sar
sar -u 1 3 | tail -n +4 > /app/splunk/script/cpu_usage.log

# Collect memory usage using sar
sar -r 1 3 | tail -n +4 > /app/splunk/script/memory_usage.log

# Collect disk I/O stats using iostat
iostat -x -d 1 3 | tail -n +7 > /app/splunk/script/disk_io.log

# Collect network stats using sar
sar -n DEV 1 3 | grep -E '^[0-9]{2}:[0-9]{2}:[0-9]{2}' > /app/splunk/script/network_stats.log

# Extract system load from /proc/loadavg
awk '{print $1" "$2" "$3}' /proc/loadavg > /app/splunk/script/system_load.log

# Combine all collected data into a single file
paste /app/splunk/script/cpu_usage.log /app/splunk/script/memory_usage.log /app/splunk/script/disk_io.log /app/splunk/script/network_stats.log /app/splunk/script/system_load.log > /app/splunk/script/performance_metrics.log

# Output the combined data to stdout
cat /app/splunk/script/performance_metrics.log
