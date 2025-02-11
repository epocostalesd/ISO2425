#!/bin/bash
#Emilio Pocostales de la Rosa
#Entregable 4. Users.sh
#11/02/2025
clear
num=1000
total=0
if [ $# -ne 0 ]; then
	num=$1
fi
echo "====================================================="
echo ""
echo "Informe de usuarios el dia $(date +%D) a las $(date +%R)"
echo ""
IFS=:
while read us x uid gid desc h shell; do
	if [ "$uid" -ge "$num" ]; then
		echo "$us - $uid"
		echo ""
		total=$((total+1))
	fi
done < /etc/passwd
echo "total: $total usuarios"
echo ""
echo "====================================================="
echo "$(date +%D) - $(date +%R) - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
