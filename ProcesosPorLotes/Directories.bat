@echo off
rem Crear un menú con dos opciones: Si el usuario pulsa 1, se creará un archivo.txt y si pulsa 2 que se cree un archivo .bat.
rem Autor: Emilio Pocostales de la Rosa
rem Fecha: 20/11/2024
echo Pulse 1 para crear un fichero
echo Pulse 2 para mostrar el arbol de directorios de su carpeta personal
echo Pulse 3 Para mostrar los archivos con extension txt del directorio actual
echo Pulse 4 Para crear los los directorios alfredoff, marinapg y ramonam en su directorio actual.
echo Pulse 5 para copiar el contenido de su carpeta de usuario a c:\copia
set /P option="Seleccione una opcion "

if %option% EQU 1 goto fich 
if %option% EQU 2 goto arbol
if %option% EQU 3 goto text
if %option% EQU 4 goto direc
if %option% EQU 5 goto copiar
echo La opcion que has seleccionado no existe
goto fin

:fich
set /P nombre="Escriba el nombre del archivo "
echo > %nombre%.txt
echo El archivo %nombre%.txt se ha creado
goto fin

:arbol
tree %userprofile%
goto fin

:text
dir *.txt
goto fin

:direc
mkdir alfredoff marinapg ramonam
echo Se han creado los directorios alfredoff marinapg ramonam
goto fin

:copiar
xcopy /s %userprofile% c:\copia
echo Se ha realizado la copia de %userprofile% a c:\copia

:fin