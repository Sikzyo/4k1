#!/bin/bash

user=$(whoami)

echo "Configuración personal para macOS"
echo "Iniciando instalación de Xcode Command Line Tools"

echo ""
if xcode-select --install; then
    echo ""
    echo "--------------"
    echo "Se ha abierto una ventana del sistema macOS."
    echo "Ve a esa ventana y completa la instalación."
    echo "Cuando la instalación haya terminado, regresa aquí."
    echo "--------------"
    while pgrep -f "Install Command Line Developer Tools" &> /dev/null; do
        sleep 5
    done
else
    echo ""
    echo "La linea de comandos ya se encuentra instalada."
fi

echo ""
echo "¡Linea de comandos instalada correctamente!"

echo "$user"
