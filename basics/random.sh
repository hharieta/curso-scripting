#!/bin/bash
# Author: Gatovsky
# Generar números aleatorios

# RANDOM hace uso del PID para generar numeros aleatorios
echo $(( ( RANDOM % 10 ) + 40 | bc))
echo "$(( ( RANDOM % 10 ) + 30))"

# manejo de RANDOM en un loop while
while :;
do
	ran=$RANDOM;
	(( ran < 32760 )) && echo $(( ( ran%10 )+1 )) && break;
done

# generar números aleatorios a partir de la fecha
echo $( date +%s ) %10  + 1 | bc 
