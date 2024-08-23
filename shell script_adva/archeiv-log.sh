#!/bin/bash

# Directory containing log files
log_directory="/var/log/"  # Replace with your log directory path

# Archive directory for old logs
archive_directory="/mnt/archive"  # Replace with your archive directory path

# Create archive directory if it doesn't exist
mkdir -p "$archive_directory"

# Find and compress log files older than 7 days
find "$log_directory" -name "*.log" -type f -mtime +7 -exec gzip {} \;

# Move compressed log files to archive directory
find "$log_directory" -name "*.gz" -type f -exec mv {} "$archive_directory" \;

echo "Log rotation and compression completed."

