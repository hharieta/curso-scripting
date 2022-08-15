#!/bin/bash
# Author: Gatovsky

saludar () {
	echo "¡Hola Mundo!"
}


parametros () {
	echo "hola, soy $1"
}

saludar

read -p "Ingresa tu nombre > " nombre
parametros $nombre
