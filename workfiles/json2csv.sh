#!/bin/bash
# Author: Gatovsky

clear
read -p "Archivo JSON: " fileIN
read -p "Archivo CSV:  " fileOUT

echo -e "value,action" > $fileOUT

jq -r '.[].popup | (.menuitem[] | [.value, .onclick] ) | join(",")' $fileIN >> $fileOUT
