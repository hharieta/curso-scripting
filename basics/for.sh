#!/bin/bash
# Author: Gatovsky

dir=($(ls))

echo -e "========== for estilo Bash ===========\n"
for i in $( ls )
do
	echo "$i"
done

echo -e "\n============ for estilo C++ ============\n"
for (( i = 0; i < ${#dir[*]}; i++ )) 
do
	echo "${dir[i]}"
done
