#!/bin/bash
#
#user input using by useraad


# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Read username and password
read -p "Enter username: " username
read -s -p "Enter password: " password
echo

# Create the user with a home directory
useradd -m "$username"

# Set the password for the user
echo "$username:$password" | chpasswd

# Optionally, add the user to a specific group
# usermod -aG groupname "$username"

echo "User $username has been created."

