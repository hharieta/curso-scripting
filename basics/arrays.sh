#!/bin/bash
# Author: Gatovsky
# con la flag -e echo permite saltos de línea \n

numeros=(1 2 3 4 5 6 7 8) # array numérico
texto=(diego julian jennifer "rosa isela" miguel) # array de strings
rangos=({A..Z} {20..30}) # array de rangos

echo -e "====== Valores del array ======\n"

echo -e "Números: ${numeros[*]} \nelementos en numeros: ${#numeros[@]}"
echo -e "Texto: ${texto[*]} \nelementos en texto: ${#texto[@]}"
echo -e "Rangos: ${rangos[*]} \nelementos en rangos: ${#rangos[@]}"

echo -e "\n======= Elemento n del array ======\n"

echo "Elemento del índice 3 en números: ${numeros[3]}"
echo "Elemento del índice 3 en texto: ${texto[3]}"
echo "Elemento del índice 3 en rangos: ${rangos[3]}"

echo -e "\n======= Eliminar n elemento del array ======\n"
unset numeros[5]
echo "${numeros[*]}"

echo -e "\n======= agregar un elemento al array ======\n"
numeros[5]=6
numeros+=(9 10)
echo "${numeros[*]}"

echo -e "\n======= iterar un array con foreach ======\n"

for n in ${numeros[*]}
do
	echo "n: $n"
done

echo -e "\n======= iterar un array con for ======\n"

for ((i=0; i<${#numeros[*]}; i++))
do
	echo "n: ${numeros[i]}"
done


