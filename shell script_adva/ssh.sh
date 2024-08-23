#!/bin/bash

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 
    exit 1
fi

# Get username
read -p "Enter username: " username

# Check if user already exists
if id "$username" &>/dev/null; then
    echo "User $username already exists."
    exit 1
fi

# Get password
read -s -p "Enter password: " password
echo

# Create user
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd
echo "User $username created successfully."

# Set up SSH access
read -p "Do you want to add an SSH key for this user? (y/n): " add_ssh_key

if [ "$add_ssh_key" = "y" ]; then
    read -p "Enter the SSH public key: " ssh_key
    
    mkdir -p /home/$username/.ssh
    echo "$ssh_key" >> /home/$username/.ssh/authorized_keys
    chown -R $username:$username /home/$username/.ssh
    chmod 700 /home/$username/.ssh
    chmod 600 /home/$username/.ssh/authorized_keys
    
    echo "SSH access set up for $username."
fi

echo "User account setup complete."
