#!/bin/bash

# Get the load averages
read -r one five fifteen rest < /proc/loadavg

# Get the number of CPU cores
cores=$(nproc)

# Calculate the load percentage
one_load_percentage=$(echo "scale=2; $one / $cores * 100" | bc)
five_load_percentage=$(echo "scale=2; $five / $cores * 100" | bc)
fifteen_load_percentage=$(echo "scale=2; $fifteen / $cores * 100" | bc)

# Print the results
echo "1 minute load average: $one_load_percentage%"
echo "5 minute load average: $five_load_percentage%"
echo "15 minute load average: $fifteen_load_percentage%"
