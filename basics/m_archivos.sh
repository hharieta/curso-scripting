#!/bin/bash
# Author: Gatovsky

input_type=""
input_name=""
input_text=""


while [ "$input_type" != "4" ]
do
	read -p "Crear directorio(1) | Crear archivo(2) | Leer archivo(3) | Salir(4)? > " input_type

	case $input_type in
		"1")
			read -p "Nombre > " input_name
			mkdir -m 700 $input_name;;
		"2")
			read -p "Nombre > " input_name
			touch $input_name
			read -p "Ingresar texto > " input_text
			echo $input_text >> $input_name
			cat $input_name;;
		"3")
			read -p "Nombre > " input_name

			while IFS= read -r line
			do
				echo "$line"
			done < $input_name
			echo "Lines: $( grep "" -c < $input_name )";;
		"4")
			echo "Adiós!";;
		*)
			echo "Opción no válida"
	esac
done

