#!/usr/bin/env zsh

DOTFILE_DIR="${0:A:h:h:h}/config/zsh"

echo "✦ Modulo zsh ✦"
setopt errexit

while true; do
    echo ""
    read "confirm_update?✦ Se va a sustituir tus configuraciones de zsh ¿Deseas continuar? [y/n]: "

    case "$confirm_update" in
        [yY])
            echo ""
            echo "=> Creando carpeta de configuración zsh"

            rm -rf "$HOME/.config/zsh"
            mkdir -p "$HOME/.config/zsh"

            echo ""
            echo "=> Copiando configuraciones de zsh"

            cp "$DOTFILE_DIR"/*.zsh "$HOME/.config/zsh/"

            echo ""
            echo "=> Actualizando archivo zsh"

            rm -f "$HOME/.zshrc"
            cp "$DOTFILE_DIR/.zshrc" "$HOME/.zshrc"

            break
        ;;
        [nN])
            echo ""
            echo "=> Omitiendo configuración de zsh"

            break
        ;;
        *)
            echo ""
            echo "=> Opción no valida, por favor presiona 'y' o 'n'"
        ;;
    esac
done