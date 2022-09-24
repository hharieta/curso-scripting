#!/bin/bash
# Author: Gatovsky
#
# uso de , para concatenar strings: Encuentra todos los ejecutables 
# que terminen en "calc" dentro de /bin y /usr/bin

for file in /{,usr/}bin/*calc ; do
	if [[ -x "$file" ]]; then
		echo $file
	fi
done
