#!/usr/bin/env zsh

GUI_APPS=("affinity" "antigravity-ide" "brave-browser" "chatgpt" "claude" "cursor" "discord" "figma" "google-gemini" "notion" "obsidian" "ollama-app" "spotify" "steam" "tidal" "visual-studio-code" "warp" "yaak" "zed" "zen" )
SELECTED_GUI_APPS=()

echo "✦ Modulo apps ✦"
set -e

for gui in "${GUI_APPS[@]}"; do
    while true; do
        echo ""
        read "install_gui?✦ ¿Quieres instalar $gui? [y/n]: "

        case $install_gui in
            [yY])
                SELECTED_GUI_APPS+=("$gui")
                break
            ;;
            [nN])
                break
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
            ;;
        esac
    done
done

echo ""
if [[ ${#SELECTED_GUI_APPS[@]} -eq 0 ]]; then
    echo "✦ No se selecciono ninguna app para instalar"
else
    echo "✦ Iniciando instalación de apps seleccionadas"
    
    for selected_gui in "${SELECTED_GUI_APPS[@]}"; do
        echo ""
        echo "=> Instalando $selected_gui"

        brew install --cask "$selected_gui"

        echo ""
        echo "✦ $selected_gui se instalo correctamente"
    done

    echo ""
    echo "✦ Todas las apps fueron instaladas correctamente"
fi