#!/bin/bash
read -s -p "Enter your password " pass
echo 
if test "$pass" != "tom"
then
    echo "Wrong password!"
fi
