#!/bin/bash
# Author: Gatovsky
# argumentos bash como parámetros de python

i=0
max=10
step=1

python3 -c "
i = $i
while i < $max:
	print(i, end=' ')
	i += $step
"
echo ""
