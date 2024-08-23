#!/bin/bash

# Function to find files based on the number of days
find_files_by_days() {
    local days=$1
    find . -type f -mtime -$days -exec ls -lh {} \; | awk '{print $9 ": " $5}'
}

# Function to find files based on date range
find_files_by_date_range() {
    local start_date=$1
    local end_date=$2
    find . -type f -newermt "$start_date" ! -newermt "$end_date" -exec ls -lh {} \; | awk '{print $9 ": " $5}'
}

# Main script
echo "Choose an option:"
echo "1. Find files created in the last N days"
echo "2. Find files created between two dates"
read -p "Enter your choice (1 or 2): " choice

if [ "$choice" -eq 1 ]; then
    read -p "Enter the number of days: " days
    find_files_by_days $days
elif [ "$choice" -eq 2 ]; then
    read -p "Enter the start date (YYYY-MM-DD): " start_date
    read -p "Enter the end date (YYYY-MM-DD): " end_date
    find_files_by_date_range $start_date $end_date
else
    echo "Invalid choice. Please run the script again."
fi

