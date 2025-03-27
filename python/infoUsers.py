"""
Entregable 1 infoUsers, operaciones sobre el sistema, usuarios y directorios.
Autor: Emilio Pocostales de la Rosa
Fecha: 26/03/2025
"""
import os

import cpuinfo

if os.getgid() != 0:
    print("Tienes que ser root")
else:
    while True:
        print("1-Mostrar informacion del SSOO e informacion del CPU")
        print("2-Informacion de usuario")
        print("3-Creacion de directorio")
        print("4-Salir")
        opt = int(input("Introduce una opcion "))
        match opt:
            case 1:
                print("Tiene un sistema operativo", os.uname().sysname, "y un procesador",
                      cpuinfo.get_cpu_info()['brand_raw'])
            case 2:
                usuario = input("introduce el nombre de un usuario ")
                users = open("/etc/passwd", "r")
                users = users.readlines()
                enc = 0
                for i in users:
                    if i.split(":")[0] == usuario:
                        print(i)
                        enc = 1
                        break
                if enc == 0:
                    os.system("useradd " + usuario)
                    print("usuario creado")
            case 3:
                direct = input("Introduzca un directorio ")
                if os.path.exists(direct):
                    if os.path.isdir(direct):
                        print("el directorio", direct, "existe")
                    else:
                        print(direct, "no es un directorio pero ya existe")
                else:
                    os.mkdir(direct)
                    print("Directorio", direct, "creado")
            case 4:
                print("Saliendo...")
                break
            case _:
                print("Opcion incorrecta")
