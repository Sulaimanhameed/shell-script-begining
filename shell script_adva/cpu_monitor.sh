#!/bin/bash

# Output file
OUTPUT_FILE="/home/sulaiman/Desktop/output_file.txt"

# Function to get CPU usage
get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'
}

# Function to get Memory usage
get_mem_usage() {
    free | grep Mem | awk '{print $3/$2 * 100.0}'
}

# Function to get Disk usage
get_disk_usage() {
    df / | grep / | awk '{print $5}' | sed 's/%//g'
}

# Write header to output file
echo -e "Timestamp\tCPU Usage (%)\tMemory Usage (%)\tDisk Usage (%)" > "$OUTPUT_FILE"

while true; do
    # Get current usage
    CPU_USAGE=$(get_cpu_usage)
    MEM_USAGE=$(get_mem_usage)
    DISK_USAGE=$(get_disk_usage)
    
    # Get current timestamp
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Write to output file
    echo -e "$TIMESTAMP\t$CPU_USAGE\t$MEM_USAGE\t$DISK_USAGE" >> "$OUTPUT_FILE"
    
    # Sleep for a specified interval (e.g., 60 seconds)
    sleep 60
done

