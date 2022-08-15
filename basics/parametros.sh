#!/bin/bash
# Author: Gatovsky
# Ejemplos de variables y parámetros dinámicos

nombre=$1
apellido=$2
echo "hola, soy $nombre $apellido"
echo "paramétros enviados: $#"
echo "parámetros son: $* \n"

ubicacion=`pwd`
echo $ubicacion
