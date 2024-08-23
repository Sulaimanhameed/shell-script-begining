#!/bin/bash

# Output file
output_file="logged_in_users.txt"

# Get the list of logged-in users with date
who | awk '{print $1, $3, $4}' > "$output_file"

echo "List of logged-in users has been written to $output_file"

