#!/bin/bash
#
#Bash Loop
#while Loop
#
i=1
while ((i<=5))
do 
   echo "Hello World"
   ((i++))  
done

sleep 4

#
#until Loop
#
until ((i>5))
do 
    echo "Hello"
    ((i++))
done   

sleep 4
#for Loop
fruit=("apple" "orange" "grapes" "berry")

for fruit in ${fruit[@]}
do 
   echo $fruit
done    


