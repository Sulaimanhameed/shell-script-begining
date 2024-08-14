#!/bin/bash
#
#read user input 
#
echo "Enter your name"
read name 
echo "your name is $name"
#
#
echo "Enter the any Number"
read num_1
echo "Enter the any Number"
read num_2

sum=$((num_1+num_2))

echo "sum is $sum"
#
#
read -p  "Enter there Nunber" n1 n2 n3

echo $((n1+n2+n3))
#
#
echo "Enter your folder name"
read folder 
mkdir $folder
#
#
echo "Usre name:"
read user
echo "password"
read -s pass

echo "$user & $pass"
