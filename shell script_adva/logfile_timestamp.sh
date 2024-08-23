#!/bin/bash

# Define the log file and output file
log_file="logfile.log"
output_file="outputfile.txt"

# Define the pattern to search for
pattern="ERROR"

# Parse the log file and extract lines containing the pattern
grep "$pattern" "$log_file" | while read -r line; do
    # Extract the timestamp and value (assuming they are the first two fields)
    timestamp=$(echo "$line" | awk '{print $1, $2}')
    value=$(echo "$line" | awk '{print $3, $4, $5, $6}')
    # Write the timestamp and value to the output file
    echo "$timestamp $value" >> "$output_file"
done

