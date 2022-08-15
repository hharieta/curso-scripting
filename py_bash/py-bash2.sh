#!/bin/bash
# Author: Gatovsky
# manejo de funciones bash y python en bash

name=""
read -p "Nombre: " name

function saludar { 
	echo "Hola $name"; 
}


function contar_py {
	python3 -c "$1";
}

saludar

read -p "contar hasta: " rango

# la función recibe un comando python como argumento 
contar_py "

for i in range(1,$rango+1):
	print(i,	end=' ')

"
echo ""

