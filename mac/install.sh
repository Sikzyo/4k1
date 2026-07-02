#!/usr/bin/env zsh

DOTFILE_DIR="$HOME/.4k1/mac/scripts"

option_menu(){
    echo "   __ __  __ _____"
    echo "  / // / / //_<  /"
    echo " / // /_/ ,<  / / "
    echo "/__  __/ /| |/ /  "
    echo "  /_/ /_/ |_/_/   "
    echo ""        
    echo ""
    echo "------------------"
    echo "Menu de opciones"
    echo "1) Instalación completa"
    echo "2) Salir"
    echo "------------------"
}

confirmation_message(){
    local name="$1"
    local next_step="$2"

    while true; do
        read "confirm_option?=> Seleccionaste la opción $name ¿Deseas continuar? [y/n]: " 

        case $confirm_option in
            [yY])
                echo ""
                echo "=> Iniciando $name..."
                echo ""
                zsh "$next_step"
                return 0
            ;;
            [nN])
                echo ""
                echo "=> Regresando al menu principal"
                return 1
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
                echo ""
            ;;
        esac
    done     
}

echo "✦ Instalador para Mac ✦"
set -e

while true; do
    option_menu
    echo ""
    read "selected_option?✦ Selecciona una opción: "

    case $selected_option in
    "1")
        echo ""
        if confirmation_message "Instalación completa" "$DOTFILE_DIR/full_install.sh"; then
            break
        fi
    ;;
    "2")
        echo ""
        echo "=> Saliendo del instalador"
        break
    ;;
    *)
        echo ""
        echo "=> Opción no valida, por favor intenta nuevamente"
    ;;
    esac
done