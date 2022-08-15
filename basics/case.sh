#!/bin/bash

# Author: Gatovsky

opcion=""
read -p "Selección [A-B] > " opcion


case $opcion in
	"A") echo "Lectura A";;
	"B") echo "Lectura B";;
	[C-Z]) echo "Valor fuera de rango";;
	*) echo "solo caracteres en [A-B]"
esac
