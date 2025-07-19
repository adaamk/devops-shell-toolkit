#!/bin/bash

# Colors
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

# CPU Load
cpu_load=$(top -bn1 | grep "load average:" | awk '{print $(NF-2), $(NF-1), $NF}')

# Memory
read mem_total mem_used <<< $(free -m | awk '/Mem:/ {print $2, $3}')
mem_percent=$(( 100 * mem_used / mem_total ))

# Disk Usage
disk_usage=$(df -h / |awk 'NR==2 {print $5}' | sed 's/%//' )

# Uptime
uptime=$(uptime -p)

# Output
echo -e "${YELLOW}System Health Report:${RESET}"
echo -e "CPU Load Avg (1, 5, 15 min): ${cpu_load}"
echo -e "Memory Usage: ${mem_used}MB / ${mem_total}MB (${mem_percent}%)"

echo -en "Disk Usage: "
if [ "$disk_usage" -ge 85 ]; then
	echo -e "${RED}${disk_usage}%${RESET} ❗ "
else
	echo -e "${GREEN}${disk_usage}%${RESET}"
fi

echo -e "Uptime: ${uptime}"

