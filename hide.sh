#!/bin/bash
#
# Oculta uno o mas archivos. Los comodines estan aceptados
#
# Por implementar:
#
#  - Desocultar (mostrar)

if [ $# -lt 1 ];then
    echo "usage: hide <file> ..." 
    return
fi

for file in "$@";do
    if [ ${file:0:1} != "." ];then
	mv $file .$file
    fi
done 
