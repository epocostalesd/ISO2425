#!/bin/bash
#Entregable 3 fiveormore
#Emilio Pocostales de la Rosa
#10/02/2025
clear
if [ $# -ne 2 ]; then
	echo "EL numero de parametros es incorrecto"
	exit
fi
if [ -f $1 ]; then
	echo "El fichero existe"
	exit
fi
if [ ! -d $2 ]; then
	echo "El directorio no existe"
	exit
fi
if [ ! "$(ls $2)" ]; then
	echo "El directorio esta vacio"
	exit
fi
total=0
echo "Emilio Pocostales de la Rosa"
for dir in $2*.txt; do
	line=$(wc -l $dir | cut -d " " -f 1 )
	if [ $line -ge 5 ]; then
		echo "$dir"
		echo "$dir" >> $1
		total=$(($total+1))
	fi
	pala=$(wc -w $dir | cut -d " " -f 1)
	text=$(cat $dir)
	echo "El fichero tiene $pala palabras" > $dir.q
	echo "$text" >> $dir.q
done
echo $total >> $1
