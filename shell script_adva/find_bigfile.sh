#!/bin/bash

# Output file
output_file="biggest_files.txt"

# Find the 10 biggest files and write to the output file
find / -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 > $output_file

echo "The 10 biggest files have been written to $output_file"

