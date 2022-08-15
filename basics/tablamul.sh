#!/bin/bash
# Author: Gatovsky

num=0
lst_nums=(1 2 3 4 5 6 7 8 9 10)

read -p "Tabla del: " num

for i in ${lst_nums[*]}
do
	echo "$num * $i = $(($num * $i))"
done


