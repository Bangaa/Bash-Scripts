#!/bin/bash
#
# Crea un nuevo proyecto con algun nombre especificado. Crea la carpeta 
# principal y las subcarpetas 'build/obj' y 'src/' en donde se alojaran los 
# archivos objeto y fuente respectivamente. Ademas crea el 'Makefile' con las 
# variables iniciales: CC, CFLAGS y VPATH que indican el compilador, las 
# banderas de compilacion y los directorios de busqueda de dependencias 
# respectivamente.
#
# Por implementar:
#
#  - Parseo de opciones para crear un proyecto versionado por git.
#  - ...

USAGE="uso: new-project [-v] <project name>"

if [ $# -lt 1 ];then
    echo $USAGE 
    exit 1
fi

if [[ -d $1 ]];then
    echo "Ya existe un directorio con ese nombre" >&2
    exit 2
fi

if [[ "$1" == "-v" ]];then
    if [[ $# -eq 2 ]];then
	verbose=TRUE
	shift
    else
	echo "Falta el nombre del proyecto" >&2
	exit 2
    fi 
else
    verbose=FALSE
fi

OBJ=$1"/build/obj"
SRC=$1"/src"

if [[ $verbose == TRUE ]];then
    flag=-v
else
    flag=""
fi

mkdir -p $flag $OBJ 
mkdir -p $flag $SRC

echo -e "CC=\nCFLAGS=\nVPATH=src:build/obj\n" > $1"/Makefile" 
echo "Done"
exit 0

