#!/bin/bash

# Replace with the actual disk path you want to unmount
disk_path="/dev/sdb1"

# Function to gracefully unmount the disk
graceful_unmount() {
    echo "Attempting to unmount disk $disk_path..."
    
    # Check if the disk is mounted
    if mountpoint -q "$disk_path"; then
        # Unmount the disk
        umount "$disk_path"
        
        if [ $? -eq 0 ]; then
            echo "Disk $disk_path successfully unmounted."
        else
            echo "Failed to unmount disk $disk_path."
        fi
    else
        echo "Disk $disk_path is not mounted."
    fi
}

# Call the function to unmount the disk
graceful_unmount

