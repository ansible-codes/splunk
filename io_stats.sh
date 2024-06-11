iostat -c 1 | awk '/avg-cpu/ {getline; print "%iowait: " $4"%"}'

iostat -c 1 | awk '/avg-cpu/ {getline; print strftime("%Y-%m-%d %H:%M:%S"), "%iowait: " $4"%"}' >> iowait_log.txt
