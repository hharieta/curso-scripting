#!/bin/bash
# Author: Gatovsky

echo "Estás en `pwd`"
echo "que contiene los siguientes archivos/carpetas:"
echo ""

for i in *; do
	echo "		$i"
done
