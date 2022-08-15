#!/bin/bash
# Author: Gatovsky
#
# Variables de usuario: solo se ejecutan en el script
# Variables de entorno: son variables del sistema

user_var="hola, soy una variable de usuario"

echo $user_var  #VARIABLE DE USUARIO
echo $GATO_PASS #VARIABLE DE ENTORNO

echo "==============================================="

num1=2
num2=3

echo "operadores aritméticas"

echo "$num1 + $num2 = " $((num1 + num2))
echo "$num1 - $num2 = " $((num1 - num2))
echo "$num1 * $num2 = " $((num1 * num2))
echo "$num1 / $num2 = " $((num1 / num2))

echo "================================================"

echo "operadores relacionales"
echo "0 = FALSE 1 = TRUE"

echo "$num1 > $num2 = " $((num1 > num2))
echo "$num1 < $num2 = " $((num1 < num2))
echo "$num1 >= $num2 = " $((num1 >= num2))
echo "$num1 <= $num2 = " $((num1 <= num2))
echo "$num1 == $num2 = " $((num1 == num2))
echo "$num1 != $num2 = " $((num1 != num2))


echo "================================================="
echo "operadores de asignación"

echo "$num1 += $num2 = " $((num1 += num2))
echo "$num1 -= $num2 = " $((num1 -= num2))
echo "$num1 *= $num2 = " $((num1 *= num2))
echo "$num1 /= $num2 = " $((num1 /= num2))

