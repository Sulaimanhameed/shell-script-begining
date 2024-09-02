#!/bin/bash
echo ${arg:=Foo}
bank=HSBC
echo ${bank:=Citi}
unset bank
echo ${bank:=Citi}

