iostat -c 1 | awk '/avg-cpu/ {getline; printf "\r%%iowait: %.2f%%", $4; fflush()}'

iostat -c 1 | awk '/avg-cpu/ {getline; print strftime("%Y-%m-%d %H:%M:%S"), "%iowait: " $4"%"}' >> iowait_log.txt
