#!/bin/bash

USER_OS="Indefinido"

case $OSTYPE in
    "darwin"*)
        USER_OS="Mac"
    ;;
    "linux"*)
        USER_OS="Linux"
    ;;
    *)
        USER_OS="Sistema no soportado"
    ;;
esac

xcode_install() {
    echo "✦ Vamos a validar si tienes instalado Xcode"

    sleep 1.5

    echo ""
    if ! xcode-select -p &> /dev/null; then
        echo "=> Instalando xcode"

        echo ""
        echo "✦ Se ha abierto una ventana del sistema macOS"
        echo "✦ Ve a esa ventana y completa la instalación"
        echo "✦ Cuando la instalación haya terminado, regresa aquí"

        sleep 1.5

        xcode-select --install

        echo ""
        while pgrep -f "Install Command Line Developer Tools" &> /dev/null; do
            sleep 5
        done

        echo ""
        echo "✦ ¡Linea de comandos instalada correctamente!"
    else
        echo "✦ La linea de comandos para Xcode ya se encuentra instalada"
    fi
}

mac_installer() {
    xcode_install

    sleep 1.5

    DOTFILE_DIR="$HOME/.4k1"

    if [ -d "$DOTFILE_DIR" ]; then
        echo ""
        echo "=> Limpiando instalaciones previas"

        rm -rf "$DOTFILE_DIR"
    fi

    sleep 1.5

    echo ""
    echo "=> Creando carpeta"

    mkdir -p "$HOME/.4k1"

    sleep 1.5

    echo ""
    echo "=> Clonando repositorio de GitHub"

    sleep 1.5

    echo ""
    git clone https://github.com/Sikzyo/4k1.git "$DOTFILE_DIR"

    cd "$DOTFILE_DIR"

    sleep 1.5

    echo ""
    bash mac/install.sh
}

finish_install() {
    echo ""
    echo "✦ Iniciando proceso de limpieza"

    sleep 1.5

    echo "=> Limpiando carpeta de instalación"

    cd "$HOME"

    rm -rf "$DOTFILE_DIR"

    sleep 1.5

    echo ""
    echo "=> Limpieza terminada"

    sleep 1.5

    echo "✦ Instalación terminada, gracias por utilizar 4k1"
    exit 0
}

echo "✦ Preparando instalación"

set -e

sleep 1.5

echo ""
echo "✦ Vamos a validar tu sistema operativo primero"

sleep 1.5

echo ""
echo "=> Validando sistema..."

sleep 1.5

echo ""
echo "✦ Tu sistema operativo es: $USER_OS"

sleep 1.5

echo ""
case "$USER_OS" in
    "Mac")
        echo "=> Iniciando configuración básica..."
        echo ""
        sleep 1.5
        mac_installer
    ;;
    "Linux")
        echo "=> Actualmente estamos trabajando en el soporte para Linux, esperamos lanzarlo lo mas pronto posible"
        sleep 1.5
        exit 0
    ;;
    *)
        echo "=> Actualmente no disponemos soporte para tu sistema operativo"
        sleep 1.5
        exit 0
    ;;
esac

finish_install