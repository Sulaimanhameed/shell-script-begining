#!/bin/bash
#
#conditional statement
#switch case statement
#
echo "Enter a character"
read char 

case $char in
     A | a )
        echo "Apple";;
     B | b ) 
        echo "bat";;
     c | c ) 
        echo "cat";;
     * ) 
        echo "Invalid character";;   

esac	

