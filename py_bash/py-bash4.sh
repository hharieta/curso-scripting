#!/bin/bash
# Author: Gatovsky
# Notificación de finalización al sistema con sys.exit

function isdigit { python3 -c "
import sys

if '$1'.isdigit():
	sys.exit(0)
else:
	sys.exit(1)
	
	";
}

read -p "Indica un número: " valor
isdigit $valor

# En bash, después de ejecutar un comando/función/programa puede leerse 
# su código de finalización mediante la variable $?
if [ $? == 0 ]; then
	echo -e "Correcto, $valor es un número \n"
else
	echo -e "Inconrrecto, $valor no es número \n"
fi

