#!/bin/bash
# Author: Gatovsky
# impresión de resultados

function x2 {
	python3 -c "print($1 * 2)"
}

x2 5

# En bash puedes ejecutar un comando en un shell hijo para asignar el resultado 
# a una variable en el shell actual. Por ejemplo
number=$(x2 4)

# Al hacer esto no se imprime el resultado en pantalla, ya que la salida estándar
# es el shell hijo (que se ejecuta en segundo plano) y lo que se imprima en el shell hijo
# es asignado a la variable number. Ahora puedes utilizar el valor de number en el shell actual
echo -e "$number \n"
# Ó puedes hacer cualquier otra cosa
while (( $number >= 1 )); 
do
	echo $number
	(( number-=1 ))
done


