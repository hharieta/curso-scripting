#!/bin/bash
#
# Author: Gatovsky

i=0

sleep 5;
while [[ $i -lt  10 ]]; do
	sleep 1
	echo "hola nc!"
	let i++
done

echo -e "\n$i"
