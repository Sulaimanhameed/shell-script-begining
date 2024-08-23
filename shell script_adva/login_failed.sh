#!/bin/bash

# Define the log file
LOG_FILE="/var/log/auth.log"

# Extract failed login attempts
FAILED_LOGINS=$(grep "Failed password" $LOG_FILE | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr)

# Print the header
echo -e "Attempts\tIP Address\tLocation"

# Loop through each failed login attempt
while read -r line; do
    ATTEMPTS=$(echo $line | awk '{print $1}')
    IP=$(echo $line | awk '{print $2}')
    
    # Get the location of the IP address
    LOCATION=$(curl -s https://ipinfo.io/$IP | grep "city" | awk -F: '{print $2}' | tr -d '", ')
    
    # Print the results
    echo -e "$ATTEMPTS\t$IP\t$LOCATION"
done <<< "$FAILED_LOGINS"

