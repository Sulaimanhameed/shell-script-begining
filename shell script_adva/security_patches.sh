#!/bin/bash

# File containing the list of servers
SERVER_LIST="servers.txt"

# Function to update and upgrade a server
update_server() {
    local server=$1
    echo "Updating server: $server"
    ssh "$server" << EOF
        sudo apt update && sudo apt upgrade -y
        sudo apt apache2 -y
        sudo apt clean -y
        echo "Updates completed on $server"
EOF
}

# Read the server list and update each server
while IFS= read -r server; do
    update_server "$server"
done < "$SERVER_LIST"

echo "All servers have been updated."

