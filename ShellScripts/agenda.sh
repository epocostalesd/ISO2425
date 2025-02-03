#!/bin/bash
# Entregable 1 agenda
# Emilio Pocostales de la Rosa
# 03/02/2025
clear

while true; do
	echo "--> Menu de opciones <--"
	echo "a-Añadir entrada"
	echo "b-buscar por DNI"
	echo "c-Ver la agenda completa"
	echo "d-Eliminar todas las entradas de la agenda"
	echo "e-Finalizar"
	read -p "Introduzca el numero de una opcion " option
	case $option in
		a)
			#crear entrada
			clear
			read -p "introduzca el DNI " dni
			dni2=$(cut -f 1 -d ":" agenda.txt | grep $dni)
			if [ "$dni" == "$dni2" ]; then
				echo "Ya existe"
			else
				read -p "Introduzca el nombre " nomb
				echo
				read -p "Introduzca el apellido " apell
				echo
				read -p "Introduzca la localidad " loca
				echo "$dni: $nomb: $apell: $loca" >> agenda.txt
			fi
		;;
		b)
			#busqueda por dni
			clear
			read -p "introduzca el DNI " dni
			dni2=$(cut -f 1 -d ":" agenda.txt | grep "$dni")
			if [ "$dni" == "$dni2" ]; then
				nomb=$(grep $dni2 agenda.txt | cut -d ":" -f 2)
				apell=$(grep $dni2 agenda.txt | cut -d ":" -f 3)
				loca=$(grep $dni2 agenda.txt | cut -d ":" -f 4)
				echo "La persona con DNI numero $dni es: $nomb $apell, y vive en $loca"
			else
				echo "El DNI numero $dni no existe"
			fi
		;;
		c)
			#mostrar agenda
			clear
			if [ -s agenda.txt ]; then
				cat agenda.txt
			else
				echo "Agenda vacia"
			fi
		;;
		d)
			#borrar archivo
			clear
			> agenda.txt
			echo "Agenda borrada"
		;;
		e)
			#salir
			clear
			exit
		;;
		*)
			#control de fallos
			clear
			echo "La opcion seleccionada no existe"
		;;
	esac
done
