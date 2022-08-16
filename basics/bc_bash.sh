#!/bin/bash
# Author: Gatovsky
# uso de Basic Calc en Bash
#
#
#
# La variable especial IFS. En Bash, el IFS (Input File Separator) 
# nos permite especificar un separador de campos luego de que la expresión $* se expanda 
# (incluyendo la lista completa de argumentos).
# La expresión scale nos permite especificar el número de dígitos decimales 
# a incluir en el resultado de la división entre los valores contenidos en 
# las variables suma y n_args.


# Números totales como argumentos
n_args=$#

# Separador de argumentos
IFS='+'

# Unión de argumentos y separador
suma=$(echo "$(( $* ))")

# mostrar la suma y cantidad de números
echo "suma: $suma"
echo "cantidad números: $n_args"

# Cálculo, en este caso promedio
promedio=$(echo "scale=2; $suma/$n_args" | bc)

echo "Promedio de los numeros: $promedio"
