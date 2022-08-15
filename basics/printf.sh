#!/bin/bash
# Author: Gatovsky
# formato de comando printf
#
#
# %s String
# %c Single character
# %d Integers
# %o Octal integers
# %x Hexadecimal integers
# %f Floating point
# %b String with backs scape
# %% Percent sing
# # modifier to display octal and hexa numbers properly


# modifier for numbers
printf "El valor octal de %d es %#o y el hexadecimal %#x \n" 30 30 30
# width modifier
printf "%-10s| %-5d\n" Edad 23
# Precision modifier
printf "Número de empleado: %.5d\n" 218
# width and precison modifier
printf "Número de empleado: %-15.5d\n" 218


# Display output in tabular format
separador=--------------------
separador=$separador$separador
filas="%-15s| %.7d| %3d| %c\n"
AnchoTabla=37

printf "%-15s| %-7s| %.3s| %s\n" Nombre ID Edad Grado
printf "%.${AnchoTabla}s\n" "$separador"
printf "$filas" "Sherlock Holmes" 122 23 A
printf "$filas" "James Bond" 7 27 F
printf "$filas" "Hercules Poirot" 6811 59 G
printf "$filas" "Jane Marple" 1234567 71 C

