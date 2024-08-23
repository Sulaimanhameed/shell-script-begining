#!/bin/bash

# Thresholds
CPU_THRESHOLD=50
MEM_THRESHOLD=50
DISK_THRESHOLD=50

# Output file
OUTPUT_FILE="/home/sulaiman/output_gmail.txt"

# Gmail credentials
GMAIL_USER="sulai4193@gmail.com"
GMAIL_PASS="sulai8220"

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

# Function to send alert email
send_alert() {
    local usage_type=$1
    local usage_value=$2
    local subject="$usage_type Usage Alert"
    local body="Alert: $usage_type usage is at $usage_value%"
    echo -e "Subject:$subject\n\n$body" | sendmail -v -r "$GMAIL_USER" -S smtp.gmail.com:587 -xu "$GMAIL_USER" -xp "$GMAIL_PASS" -t "$GMAIL_USER"
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
    
    # Check thresholds and send alerts
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "CPU" "$CPU_USAGE"
    fi
    
    if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        send_alert "Memory" "$MEM_USAGE"
    fi
    
    if (( $(echo "$DISK_USAGE > $DISK_THRESHOLD" | bc -l) )); then
        send_alert "Disk" "$DISK_USAGE"
    fi
    
    # Sleep for a specified interval (e.g., 60 seconds)
    sleep 30
done

