#!/bin/bash
#
# Oculta uno o mas archivos. Los comodines estan aceptados
#
# Por implementar:
#
#  - Desocultar (mostrar)

get_file_begin ()
{
    if [ $# -lt 1 ];then
	exit 1
    fi

    (( INDEX = 0 ))
    for (( i=${#1} ; i>=1; i-- ));do
	if [ "${1:i-1:1}" == "/" ];then
	    (( INDEX = $i ))
	    break
	fi
    done

    echo $INDEX
}

if [ $# -lt 1 ];then
    echo "usage: hide <file> ..." 
    return
fi

for file in "$@";do
    (( SPLIT_AT= $(get_file_begin $file) ))
    DIR=${file:0:SPLIT_AT}
    FILENAME=${file:SPLIT_AT}

    if ! [ -e $file ];then
	echo "error: No existe el fichero o directorio \"$file\" " >&2
    elif [ ${FILENAME:0:1} != "." ];then
	mv "$DIR""$FILENAME" "$DIR"."$FILENAME"
    fi
done 
