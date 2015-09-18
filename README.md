# Bash-Scripts

El propósito de estos scripts, o archivos de procesamiento por lotes, es 
facilitar algunas tareas tediosas que uno hace aveces por terminal, como por 
ejemplo, quitar los espacios en el nombre de los archivos. Estas y otras tareas 
que se hacen mas de un par de veces a través de la terminal, se pueden hacer en 
menos de 1 segundo con ayuda de estos scripts.

## Instalación

* Clona los archivos del repositorio dentro de una carpeta que contenga todos 
  tus scripts, en este caso '$HOME/bin/'.
```
  $ git clone git://github.com/Bangaa/Bash-Scripts.git ~/bin
```
* Luego a tu archivo de configuración de la bash ('~/.bashrc' o similar) 
  agregar la linea que le dice donde buscar cuando ejecutas un comando:
  `export PATH="$HOME/bin/:$PATH"`, esto lo haces con el siguiente comando
```
  $ echo 'export PATH="$HOME/bin/:$PATH"' >> ~/.bashrc
```

Listo!, ya puedes llamar a cualquier script mediante la linea de comandos.

## Uso

Supongamos que tenemos archivos que tienen espacios en el nombre

```
$ ls -1
Archivo nombrado con espacios.pdf  
carpeta con espacios
```
esto puede causar más de algún problema, sobre todo cuando estamos programando, 
y necesitamos compilar el proyecto. Cuando tenemos solo 1 archivo no es tan 
terrible pero cuando tenemos más se vuelve tedioso, incluso si sabemos algo del 
uso de `for` en la terminal. Para solucionar esto ejecute:

	$ quitar-espacios Archivo\ nombrado\ con\ espacios.pdf carpeta\ con\ espacios/

o simplemente

	$ quitar-espacios ./*

para quitar el espacio de los nombres de todos los archivos que se encuentran 
en la carpeta. El resultado es el siguiente:

```
$ quitar-espacios ./*
2 archivos ahora sin espacios
$ ls -1
Archivo_nombrado_con_espacios.pdf
carpeta_con_espacios
```

El resto de los scripts funcionan de manera similar. Solo basta con escribir el 
nombre del script seguido del nombre de archivos o directorios que se desean 
procesar. Los [comodines][1] están aceptados.

[1]:https://unamiradaentrebytes.wordpress.com/2012/12/16/bash-ii-expansion-de-nombres-de-ficheros-comodines/
