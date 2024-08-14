#!/bin/bash
#
# Conditional statement
# if statement 
#
echo "Enter a number"
read num

if (( num > 0 ))
then
  echo "It's good"
elif (( num < 0 ))
then
  echo "It's not good"
else
  echo "Zero"   
fi
#
#
# Using by user
user="sulaiman"
pass="1234"

echo "Enter username"
read user_1
echo "Enter password"
read -s pass_1

if [[ "$user" == "$user_1" && "$pass" == "$pass_1" ]]
then
     echo "Welcome to Sulaiman" 
else
     echo "Invalid credentials"
fi

