#!/bin/bash
#Entregable 2 calculadora
#Emilio Pocostales de la Rosa
#04/02/2025
clear

if [ $# -ne 2 ]; then
	echo "Numero de parametros introducidos incorrecto"
	exit
fi
if [ -f $1 ]; then
	echo "El fichero ya existe"
	exit
fi
echo "Emilio Pocostales de la Rosa"
operan=0
while [ $operan -lt $2 ]; do
	read -p "Operacion op1 op2: " operador op1 op2
	case $operador in
		s)
			result=$((op1+op2))
			echo "El resultado de $op1 + $op2 es $result"
			echo "$operador $op1 $op2" >> $1
		;;
		r)
			result=$((op1-op2))
                        echo "El resultado de $op1 - $op2 es $result"
                        echo "$operador $op1 $op2" >> $1
		;;
		m)
			result=$((op1*op2))
                        echo "El resultado de $op1 * $op2 es $result"
                        echo "$operador $op1 $op2" >> $1
		;;
		d)
			result=$((op1/op2))
                        echo "El resultado de $op1 entre $op2 es $result"
                        echo "$operador $op1 $op2" >> $1
		;;
		x)
			break
		;;
		*)
			echo "Opcion no valida"
		;;
	esac
	operan=$((operan+1))
done
echo "Proceso finalizado"
pwd $1
cat $1
