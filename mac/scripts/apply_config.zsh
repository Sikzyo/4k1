#!/usr/bin/env zsh

setopt errexit
trap alert_error ZERR

SCRIPTS_DIR="${0:A:h}/config_appliers"
ALL_CONFIGS=("$SCRIPTS_DIR"/*(N))

alert_error() {
    echo ""
    echo "=> La ejecución se detuvo porque un modulo o comando fallo"
    echo "=> Saliendo de la instalación"
    exit 1
}

menu_settings() {
    echo "----------------------------------------"
    echo "✦ Aplicar configuraciones recomendadas ✦"
    echo "----------------------------------------"
}

while true; do
    clear
    menu_settings

    echo ""
    read "confirm_settings?✦ Se va a sustituir TODAS las configuraciones que tengas ¿Deseas continuar? [y/n]: "

    case "$confirm_settings" in
        [yY])
            break
        ;;
        [nN])
            exit 0
        ;;
        *)
            echo ""
            echo "=> Opción no valida, por favor presiona 'y' o 'n'"
        ;;
    esac
done

echo ""
echo "=> Aplicando configuraciones"

for config in "$ALL_CONFIGS[@]"; do
    applier_script="$config"
    
    if [[ -f $applier_script ]]; then
        echo ""
        zsh "$applier_script"
    fi
done