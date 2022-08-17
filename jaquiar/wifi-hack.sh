#!/bin/bash
# Author: Gatovsky
#
#
# Colors
greenColor="\e[0;32m\033[1m"
endColor="\033[0m\e[0m"
redColor="\e[0;31m\033[1m"
blueColor="\e[0;34m\033[1m"
yellowColor="\e[0;33m\033[1m"
purpleColor="\e[0;35m\033[1m"
turquoiseColor="\e[0;36m\033[1m"
greyColor="\e[0;37m\033[1m"

export DEBIAN_FRONTEND=noninteractive  # evita la ventana interactiva en la terminal a la hora de instalar

trap ctrl_c INT

function ctrl_c {
	echo -e "\n${yellowColor}[*]${endcolor}${greyColor}Saliendo${endColor}"
	tput cnorm  # coloca el cursor normal
	airmon-ng stop ${network_card}mon >& /dev/null  # detiene el modo monitor de la tarjeta
	exit 0
}

#sleep 6

# function help panel 
function helpPanel {
	echo -e "\n${yellowColor}[*]${endColor}${greyColor} Uso: ./jaquiar.sh${endColor}\n"
	echo -e "\t${purpleColor}a)${endColor}${yellowColor} Modo de ataques${endColor}"
	echo -e "\t\t${redColor}Handshake${endColor}"
	echo -e "\t\t${redColor}PKMID${endColor}"
	echo -e "\t${purpleColor}n)${endColor}${yellowColor} Tarjeta de red${endColor}"
	exit 0
}


# install dependencies
function dependencies {
	tput civis  # pone el cursos invisible
	clear; dependencies=(aircrack-ng macchanger)
	echo -e "${yellowColor}[*]${endColor}${greyColor} Comprobando dependecias...${endColor}"
	sleep 2

	for program in ${dependencies[*]}; do
		echo -ne "\n${yellowColor}[*]${endColor}${blueColor} Herramienta${endColor}${purpleColor} $program${endColor}${blueColor}... ${endColor}"
		
		test -f /usr/bin/$program 
		if [[ "$(echo $?)" == "0" ]]; then
			echo -e "${greenColor}(V)${endColor}"
		else
			echo -e "${redColor}(X)${endColor}\n"
			echo -e "${yellowColor}[*]${endColor}${greyColor} Instalando herramienta ${endColor}${blueColor}$program${endColor}${yellowColor}...${endColor}"
			apt install $program -y >& /dev/null  # Redirige el error y salida estándar a null 
		fi; sleep 1
	done

}


function startAttack {
	clear
	echo -e "${yellowColor}[*]${endColor}${greyColor} Configurando tarjeta de red...${endColor}\n"
	# iniciando modo monitor
	airmon-ng start $network_card >& /dev/null
	# dar de baja tarjeta de red
	ifconfig ${network_card}mon dow && macchanger -a ${network_card}mon >& /dev/null
	# dar de alta la nueva tarjeta de red
	ifconfig ${network_card}mon up  
	# manejar procesos conflictivos
	killall dhclient wpa_supplicant 2> /dev/null

	echo -e "${yellowColor}[*]${endColor}${greyColor} Nueva dirección MAC asignada ${endColor}${purpleColor}[${endColor}${blueColor}$(macchanger -s ${network_card}mon | grep -i current | xargs | cut -d ' ' -f '3-10')${endColor}${purpleColor}]${endColor}"

}


##### MAIN FUNCTION #####
if [[ $(id -u) == 0 ]]; then
	# declare -i acota espacio en memoria
	declare -i parameter_counter=0
	while getopts ":a:n:h" arg; do
		case $arg in
			"a") attack_mode=$OPTARG; let parameter_counter+=1 ;;
			"n") network_card=$OPTARG; let parameter_counter+=1 ;;
			"h") helpPanel ;;
		esac
	done
	
	# Verifica si el programa se está ejecutando correctamente
	if [[ $parameter_counter -ne 2 ]]; then
		helpPanel
	else
		dependencies
		startAttack
		tput cnorm  # coloca el cursor normal
		airmon-ng stop ${network_card}mon >& /dev/null  # detiene el modo monitor de la tarjeta
	fi


else
	echo -e "\n${redColor}[*] No soy root ${endColor}\n"
fi

