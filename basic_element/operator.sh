#!/bin/bash
#
#Arithemtic Operation

num1=20
num2=10
num3=2 

resutl=$((num1+num2))
echo $resutl
sleep 2
resutl=$((num1*num2))
echo $resutl
sleep 2
resutl=$((num1/num2))
echo $resutl
sleep 2
resutl=$((num1-num2))
echo $resutl
sleep 2
resutl=$((num1+num2))
echo $resutl
sleep 2
resutl=$((num1%num3))
echo "$resutl modulo operator"
sleep 2
resutl=$((num1**num3))
echo "$resutl 20*20*20="
sleep 2
resutl=$((num1+=20))
echo $resutl
sleep 2



