#!/bi/bash
# Author: Gatovsky
clear
x=5

while [[ $x -ge 1 ]]; do
	echo "$x"; x=$(( x-1 ))
done

while getopts "u:p:" FLAG; do
	case "${FLAG}" in
		u) echo "el usuario '-u' es " "${OPTARG}" ;;
		p) echo "el password '-p' es " "${OPTARG}" ;;
		*) echo "opción no válida. Use '-u' '-p' " ;;
	esac
done
