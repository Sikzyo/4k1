#!/usr/bin/env zsh

TUI_APPS=("codex" "claude-code" "antigravity-cli")
CLI_APPS=("opencode" "neovim" "micro")
SELECTED_TUI_APPS=()
SELECTED_CLI_APPS=()

echo "✦ Modulo apps de terminal ✦"
setopt errexit

for tui in "${TUI_APPS[@]}"; do
    while true; do
        echo ""
        read "install_tui?✦ ¿Quieres instalar $tui? [y/n]: "

        case "$install_tui" in
            [yY])
                SELECTED_TUI_APPS+=("$tui")
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

for cli in "${CLI_APPS[@]}"; do
    while true; do
        echo ""
        read "install_cli?=> ¿Quieres instalar $cli? [y/n]: "

        case "$install_cli" in
            [yY])
                SELECTED_CLI_APPS+=("$cli")
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
if [[ ${#SELECTED_TUI_APPS[@]} -eq 0 && ${#SELECTED_CLI_APPS[@]} -eq 0 ]]; then
    echo "✦ No se selecciono ninguna app de terminal para instalar"
else
    echo "✦ Iniciando instalación de apps seleccionadas"

    for selected_tui in "${SELECTED_TUI_APPS[@]}"; do
        echo ""
        echo "=> Instalando $selected_tui"

        brew install --cask "$selected_tui"

        echo ""
        echo "✦ $selected_tui se instalo correctamente"
    done

    for selected_cli in "${SELECTED_CLI_APPS[@]}"; do
        echo ""
        echo "=> Instalando $selected_cli"

        brew install "$selected_cli"

        echo ""
        echo "✦ $selected_cli se instalo correctamente"
    done
    
    echo ""
    echo "✦ Todas las apps de terminal fueron instaladas correctamente"
fi