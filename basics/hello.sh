#!/bin/bash
#Autor: Gatovsky

pwd
cd $HOME/Descargas
if [ `pwd` = $HOME ]; then
	echo "hello world from Bash!"
else
	echo "can't run this script"
fi
pwd
