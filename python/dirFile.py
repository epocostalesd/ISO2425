"""
Entregable 2 dirFile, operaciones con ficheros y directorios
Emilio Pocostales de la Rosa
Fecha: 27/03/2025
"""
import shutil
import os

listadir = []
listafich = []
fich = open("rutas.txt", "r")
for i in fich:
    r = i.strip()
    if os.path.isfile(r):
        listafich.append(r)
    elif os.path.isdir(r):
        listadir.append(r)
while True:
    print("A-Eliminar fichero")
    print("B-Mostrar informacion de directorio")
    print("C-Copiar y pegar fichero")
    print("D-Mostrar listas")
    print("E-Salir")
    opt = input("Introduzca una opcion: ")
    match opt:
        case "A":
            fich = input("Introduzca el fichero a eliminar ")
            if os.path.isfile(fich):
                os.remove(fich)
                if os.path.exists(fich):
                    print("Ha sucedido un error al eliminar", fich)
                else:
                    print("Fichero", fich, "eliminado")
            else:
                if os.path.exists(fich):
                    print(fich, "no es un fichero")
                else:
                    print(fich, "no existe")
        case "B":
            direct = input("Introduzca el directorio ")
            if os.path.isdir(direct):
                info = os.listdir(direct)
                for i in info:
                    print(i)
            else:
                if os.path.exists(direct):
                    print(direct, "no es un directorio")
                else:
                    print(direct, "no existe")
        case "C":
            fich = input("Introduzca el archivo a copiar ")
            if os.path.isfile(fich):
                direct = input("Introduzca el directorio destino ")
                if os.path.isdir(direct):
                    fichnuevo = input("Introduzca el nuevo nombre del archivo")
                    shutil.copy(fich, direct + "/" + fichnuevo)
                    if os.path.exists(direct + "/" + fichnuevo):
                        print("El archivo", fich, "se ha copiado correctamente")
                    else:
                        print("Ha sucedido un error al copiar el archivo")
                else:
                    if os.path.exists(direct):
                        print(direct, "No es un directorio")
                    else:
                        print(direct, "No existe")
            else:
                if os.path.exists(fich):
                    print(fich, "No es un fichero")
                else:
                    print(fich, "No existe")
        case "D":
            print("Pulse 1 para ver la lista de ficheros de rutas.txt")
            print("Pulse 2 para ver la lista de directorios de rutas.txt")
            print("Pulse 3 para cancelar")
            opt = int(input("Seleccione una opcion "))
            match opt:
                case 1:
                    for i in listafich:
                        print(i)
                case 2:
                    for i in listadir:
                        print(i)
                case 3:
                    print("Operacion cancelada")
                case _:
                    print("Opcion no valida, operacion cancelada")
        case "E":
            print("Saliendo...")
            break
        case _:
            print("Opcion no valida, recuerde usar mayusculas al elegir opcion")
