#!/bin/bash
# Author: Gatovsky

cadena1=$1
cadena2=$2

if [ $cadena1 = $cadena2 ]; then
	echo "son iguales"
else
	echo "son distintas"
fi
