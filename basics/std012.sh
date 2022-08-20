#!/bin/bash
# Author: Gatovsky
#
# Manejo de estándares en linux

# estándar input: 0
echo -e "$(head -5 < $1)"

# estándar output: 1
head -10 $1 > std1.txt

# estándar error: 2
cat /etc/pwss 2> std2.txt

# mandar el stdr junto con la salida stdout
cat /etc/passwdd > std12.txt 2>&1
cat /etc/passwd >& std12_2.txt


