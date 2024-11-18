@echo off
rem Argumentos por linea de comandos
rem Autor: Emilio Pocostales de la Rosa
rem Fecha: 18/11/2024

set operando1=%1
set operando2=%2
set operando3=%3
set /A sum=operando1+operando2+operando3
set /A sum2=sum/3
 
echo la media de %1 %2 y %3 es igual a %sum2%