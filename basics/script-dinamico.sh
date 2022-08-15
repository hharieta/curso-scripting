#!/bin/bash
# Author: Gatovsky
# Script iteractivo
#
# -eq equal
# -ne not equal
# -gt greater than
# -ge greater than or equal to
# -lt less than
# -le less than or equal to
#
name=""
age=0
year=0

read -p "Nombre > " name
read -p "Edad > " age
read -p "Año > " year

echo "Hola mi nombre es $name y tengo $age años."
echo "=========================================="

if [ $age -ge 18 ]; then
	echo "mayor de edad"
else
	echo "menor de edad"
fi

echo "=========================================="
if [ $age -ge 18 ] && [ $year -eq 2022 ]; then
	echo "Es año de elecciones, sal a votar"
else
	echo "No se cumplen las condiciones para generar el voto"
fi
