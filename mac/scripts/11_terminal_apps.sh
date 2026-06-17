terminal_apps=("warp" "open-code" "codex" "claude-code" "antigravity-cli")
selected_terminal_apps=()
DOTFILE_DIR="$HOME/.dotfile"

echo "✦ Instalación de herramientas de terminal"

for terminal in "${terminal_apps[@]}"; do
    echo ""
    read -p "✦ ¿Quieres instalar $terminal? [y/n]: " install_terminal_app

    case "$install_terminal_app" in
    [yY])
        selected_terminal_apps+=("$terminal")
        ;;
    *)
    ;;
    esac
done

for selected in "${selected_terminal_apps[@]}"; do
    case "$selected" in
    "warp")
        app_path="/Applications/Warp.app"
        if [ -d "$app_path" ]; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected"

            echo ""
            brew install --cask warp

            echo ""
            echo "✦ Se instalo correctamente $selected"
        fi
        ;;
    "open-code")
        if command -v opencode &> /dev/null; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected"

            echo ""
            brew install opencode

            echo ""
            echo "✦ Se instalo correctamente $selected"
        fi
        ;;
        "codex")
        if command -v codex &> /dev/null; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected"

            echo ""
            brew install --cask codex

            echo ""
            echo "✦ Se instalo correctamente $selected"
        fi
        ;;
        "claude-code")
        if command -v claude &> /dev/null; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected"

            echo ""
            brew install --cask claude-code

            echo ""
            echo "✦ Se instalo correctamente $selected"
        fi
        ;;
        "antigravity-cli")
        if command -v agy &> /dev/null; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected"

            echo ""
            brew install --cask antigravity-cli

            echo ""
            echo "✦ Se instalo correctamente $selected"
        fi
        ;;
    *)
        echo ""
        echo "✦ No hay mas herramientas que instalar"
        ;;
    esac
done

echo ""
echo "✦ Herramientas de terminal instaladas exitosamente."