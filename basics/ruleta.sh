#!/bin/bash 
# Author: Gatovsky
# Ruleta rusa en bash

# p=$(( ( RANDOM % 6 ) + 1 | bc))
# echo $(shuf -i 1-6 -n6)
# echo $p

function ruleta {
	pistola=($(shuf -i 1-6 -n6))    # genera 6 números de manera aleatoria
	cilindro=$(( ( RANDOM % 6 ) + 1 | bc))    # genera un número aleatorio 1-6

	read -p "Presiona ENTER: " input
	for bala in ${pistola[*]}
	do
		if [[ bala -eq cilindro ]]; then
			echo $GATO_PASS | sudo -S apt update
			break
		else
			read -p "Presiona ENTER: " input
		fi
	done

}

ruleta
