#!/bin/bash

read -p "Enter New Username: " username

# Check if user already exists 
if id "$usernaem"&>/dev/null; then
	echo "❌ User '$username' already exists."
        exit 1
fi

read -p "Enter password: " -s password 
echo 
read -p "Enter group (Leave blank for none): " group

# If group provided and doesn't exist -> create it

if [ -n "$group" ];then
	if !getent group "$group" >/dev/null;then
		echo "🔧 Creating group '$group'..."
	fi
	useradd -m -g "$group" "$username"
else
	useradd -m "$username"
fi

# Set password
echo "$username:$password" | chpasswd

echo "✅ User '$username' created successfully."
