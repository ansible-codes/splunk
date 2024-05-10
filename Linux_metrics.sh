#!/bin/bash

# Define your Splunk server details
SPLUNK_SERVER="your_splunk_server"
SPLUNK_PORT="your_splunk_port"
SPLUNK_INDEX="your_splunk_index"
SPLUNK_TOKEN="your_splunk_token"

# Function to collect CPU usage
get_cpu_usage() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU_Usage: $CPU_USAGE"
}

# Function to collect memory usage
get_memory_usage() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory_Usage: $MEMORY_USAGE"
}

# Function to collect disk usage
get_disk_usage() {
    DISK_USAGE=$(df -h | awk '$NF=="/"{printf "%s", $5}')
    echo "Disk_Usage: $DISK_USAGE"
}

# Function to collect network usage
get_network_usage() {
    NETWORK_USAGE=$(ifstat 1 1 | grep -i "total" | awk '{print $6}')
    echo "Network_Usage: $NETWORK_USAGE"
}

# Function to collect OS health
get_os_health() {
    OS_HEALTH=$(uptime)
    echo "OS_Health: $OS_HEALTH"
}

# Main function to run all the metrics functions and send to Splunk
main() {
    while true; do
        TIMESTAMP=$(date +%s)
        METRICS="{ \"timestamp\": $TIMESTAMP, $(get_cpu_usage), $(get_memory_usage), $(get_disk_usage), $(get_network_usage), $(get_os_health) }"
        echo "$METRICS" | curl -X POST -H "Authorization: Splunk $SPLUNK_TOKEN" -d @- "https://$SPLUNK_SERVER:$SPLUNK_PORT/services/collector/raw?channel=$SPLUNK_INDEX"
        sleep 60  # Adjust the sleep duration as needed
    done
}

main
