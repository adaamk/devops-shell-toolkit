#!/bin/bash

read -p "Enter package name: " package

if dpkg -s "$package" &>/dev/null; then
    echo "✅ Package '$package' is already installed."
else
    echo "📦 Package '$package' is not installed. Installing..."
    sudo apt update -qq
    sudo apt install -y "$package"

    if [ $? -eq 0 ]; then
        echo "✅ Installed successfully."
    else
        echo "❌ Installation failed."
    fi
fi

