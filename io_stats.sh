iostat -c 1 2 | awk '/avg-cpu/ {getline; printf "%s %%iowait: %.2f%%\n", strftime("%Y-%m-%d %H:%M:%S"), $4}'
iostat -c 1 2 | awk '/avg-cpu/ {getline; print "%iowait: " $4"%"}'
