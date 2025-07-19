#!/bin/bash

read -p "Enter service name: " service

status=$(systemctl is-active "$service")

if [ "$status" == "active" ]; then
    echo "✅ Service '$service' is running."
else
    echo "❌ Service '$service' is not running. Restarting..."
    systemctl restart "$service"

    if [ $? -eq 0 ]; then
        echo "$(date): Restarted $service" >> ~/service_restarts.log
        echo "✅ Restarted successfully."
    else
        echo "❌ Failed to restart $service."
    fi
fi

