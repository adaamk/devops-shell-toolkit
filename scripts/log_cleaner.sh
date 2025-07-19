#!/bin/bash

# Defaults
LOG_DIR="/var/log"
DAYS=7

#Custom input
read -p "Enter log directory [default: /var/log]: " input_dir
read -p "Delete files older than how many days? [default: 7]: " input_days

LOG_DIR=${input_dir:-/var/log}
DAYS=${input_days:-7}

echo "Cleaning logs older than $DAYS days in $LOG_DIR..."

find "$LOG_DIR" -type f -mtime +$DAYS -exec rm -f {} \;

echo "✅ Cleanup complete."
