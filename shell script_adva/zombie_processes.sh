#!/bin/bash

# Find zombie processes
zombie_pids=$(ps aux | awk '$8=="Z" {print $2}')

# Check if any zombies were found
if [ -z "$zombie_pids" ]; then
    echo "No zombie processes found."
    exit 0
fi

echo "Found zombie processes with PIDs: $zombie_pids"

# Attempt to kill parent processes of zombies
for pid in $zombie_pids; do
    ppid=$(ps -o ppid= -p "$pid")
    if [ -n "$ppid" ]; then
        echo "Attempting to kill parent process (PID: $ppid) of zombie (PID: $pid)"
        kill -9 "$ppid"
    else
        echo "Could not find parent process for zombie (PID: $pid)"
    fi
done

# Check if zombies are gone
remaining_zombies=$(ps aux | awk '$8=="Z" {print $2}')
if [ -z "$remaining_zombies" ]; then
    echo "All zombie processes have been eliminated."
else
    echo "Some zombie processes could not be killed. Remaining zombies: $remaining_zombies"
fi
