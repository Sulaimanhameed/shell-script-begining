#!/bin/bash

# Function to find and kill all zombie processes
kill_zombies() {
    # Get the list of all zombie processes
    zombies=$(ps aux | awk '{ print $8 " " $2 }' | grep -w Z | awk '{ print $2 }')

    # Check if there are any zombie processes
    if [ -z "$zombies" ]; then
        echo "No zombie processes found"
    else
        # Kill all the zombie processes
        echo "Killing zombie processes: $zombies"
        kill -9 $zombies
        echo "Zombie processes killed"
    fi
}

# Call the function to kill zombie processes
kill_zombies

