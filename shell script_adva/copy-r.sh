#!/bin/bash

# Variables
LOCAL_DIR="/home/sulaiman/Documents/shell_script/shell script_adva/copy-r.sh"
REMOTE_USER="vagrant"
REMOTE_HOST="192.168.201.11"
REMOTE_DIR="/vagrant"

# Copy files recursively
scp -r "$LOCAL_DIR" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "Files copied successfully!"
else
    echo "Error occurred during file copy."
fi

