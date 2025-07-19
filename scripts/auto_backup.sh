#!/bin/bash

if [ -z "$1" ]; then
	echo -e "Error ❌ write the path of the dir you want to back up \nUsage: $0 /path/to/folder"
	exit 1
fi

SRC="$1"
DATE=$(date +%F_%H-%M)
BASENAME=$(basename "$SRC")
BACKUP_FILE="${BASENAME}_backup_${DATE}.tar.gz"

# Run Backup
tar -czf "$BACKUP_FILE" "$SRC" 2>/dev/null

# Result
if [ $? -eq 0 ]; then
	echo "✅ Backup complete: $BACKUP_FILE"
else
	 echo "❌ Backup failed"
	 exit 2
fi


