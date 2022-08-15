#!/bin/bash
# Author: Gatovsky
# sumar números con python y comando let de bash

# en la función calc python hace el trabajo de sumar lo que reciba en $1
function calc { python3 -c "
print($1)
";
}

# función que usa let para sumar los números
function calc2 {
        r=0
        let r=$1
        echo "$r"
}

echo "============ suma con Python ==========="
x=$( calc 5+5 )
echo "$x"

echo "============ suma con let de Bash ==========="
y=$(calc 5+5)
echo "$y"
