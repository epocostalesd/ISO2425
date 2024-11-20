@echo off
rem Crear un menú con dos opciones: Si el usuario pulsa 1, se creará un archivo.txt y si pulsa 2 que se cree un archivo .bat.
rem Autor: Emilio Pocostales de la Rosa
rem Fecha: 20/11/2024

set /P option="pulse 1 para crear un archivo.txt o 2 para un archivo.bat "

if %option% EQU 1 goto caso1
if %option% EQU 2 goto caso2
echo La opcion que ha introducido no existe
goto fin

:caso1
set/P nombre_archivo="Introduzca el nombre del archivo"
echo > %nombre_archivo%.txt
goto fin

:caso2
set/P nombre_archivo="Introduzca el nombre del archivo"
echo > %nombre_archivo%.bat

:fin