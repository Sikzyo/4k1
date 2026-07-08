#!/usr/bin/env zsh

USER_OS="Indefinido"
DOTFILE_DIR="$HOME/.4k1"

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

    echo ""
    if ! xcode-select -p &> /dev/null; then
        echo "=> Instalando xcode"

        echo ""
        echo "✦ Se ha abierto una ventana del sistema macOS"
        echo "✦ Ve a esa ventana y completa la instalación"
        echo "✦ Cuando la instalación haya terminado, regresa aquí"

        xcode-select --install

        echo ""
        while pgrep -f "Install Command Line Developer Tools" &> /dev/null; do
            sleep 5
        done

        if xcode-select -p &> /dev/null; then
            echo "✦ ¡Linea de comandos instalada correctamente!"
        else
            echo "✦ La instalación de las herramientas fallo"
            echo "✦ No se puede continuar con la instalación"
            exit 1
        fi
    else
        echo "✦ La linea de comandos para Xcode ya se encuentra instalada"
    fi
}

mac_installer() {
    xcode_install

    if [ -d "$DOTFILE_DIR" ]; then
        echo ""
        echo "=> Limpiando instalaciones previas"

        rm -rf "$DOTFILE_DIR"
    fi

    echo ""
    echo "=> Creando carpeta"

    mkdir -p "$HOME/.4k1"

    echo ""
    echo "=> Clonando repositorio de GitHub"

    echo ""
    git clone https://github.com/Sikzyo/4k1.git "$DOTFILE_DIR"

    # cd "$DOTFILE_DIR"

    zsh mac/install.sh
}

finish_install() {
    echo ""
    echo "✦ Iniciando proceso de limpieza"

    echo ""
    echo "=> Limpiando carpeta de instalación"

    cd "$HOME"

    rm -rf "$DOTFILE_DIR"

    echo ""
    echo "✦ Limpieza terminada"

    echo ""
    echo "✦ Instalación terminada, gracias por utilizar 4k1"
    exit 0
}

echo "✦ Preparando instalación"

set -e

echo ""
echo "✦ Vamos a validar tu sistema operativo primero"

echo ""
echo "=> Validando sistema..."

echo ""
echo "✦ Tu sistema operativo es: $USER_OS"

echo ""
case "$USER_OS" in
    "Mac")
        echo "=> Iniciando configuración básica..."
        echo ""
        mac_installer
    ;;
    "Linux")
        echo "=> Actualmente estamos trabajando en el soporte para Linux, esperamos lanzarlo lo mas pronto posible"
        exit 0
    ;;
    *)
        echo "=> Actualmente no disponemos soporte para tu sistema operativo"
        exit 0
    ;;
esac

finish_install