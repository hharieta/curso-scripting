#!/bin/bash
# Autor: Gatovsky
#


if [[ -f asaltante.sh ]]; then
	echo $GATO_PASS | sudo -S mv asaltante.sh /dev/null && echo "done"
else
	echo "pass" && exit 0
fi
