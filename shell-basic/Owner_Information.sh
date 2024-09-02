#!/bin/bash
read -r -t 10 -p "Enter the Internet domain name (e.g. nixcraft.com) : " domain_name

echo whois "$domain_name"

