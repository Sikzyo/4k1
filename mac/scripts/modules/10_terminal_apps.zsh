#!/usr/bin/env zsh

MANDATORY_TUI_APPS=()
MANDATORY_CLI_APPS=("neovim" "micro")

OPTIONAL_TUI_APPS=("codex" "claude-code" "antigravity-cli")
OPTIONAL_CLI_APPS=("opencode")

echo "✦ Modulo apps de terminal ✦"
setopt errexit

is_installed() {
    local app="$1"
    
    if command -v "$app" &> /dev/null; then
        return 0
    fi
    
    if brew list "$app" &> /dev/null; then
        return 0
    fi
    
    if brew list --cask "$app" &> /dev/null; then
        return 0
    fi
    
    return 1
}

echo ""
echo "✦ Instalando aplicaciones de terminal..."

for app in "${MANDATORY_TUI_APPS[@]}"; do
    echo ""
    echo "=> Validando $app"
    if is_installed "$app"; then
        echo "✦ $app ya se encuentra instalado"
    else
        echo "=> Instalando $app"
        brew install --cask "$app"
        echo "✦ $app instalado correctamente"
    fi
done

for app in "${MANDATORY_CLI_APPS[@]}"; do
    echo ""
    echo "=> Validando $app"
    if is_installed "$app"; then
        echo "✦ $app ya se encuentra instalado"
    else
        echo "=> Instalando $app"
        brew install "$app"
        echo "✦ $app instalado correctamente"
    fi
done

for app in "${OPTIONAL_TUI_APPS[@]}"; do
    echo ""
    echo "=> Validando $app"
    if is_installed "$app"; then
        echo "✦ $app ya se encuentra instalado"
    else
        while true; do
            read "install_app?✦ ¿Quieres instalar $app? [y/n]: "
            case "$install_app" in
                [yY])
                    echo ""
                    echo "=> Instalando $app"
                    brew install --cask "$app"
                    echo "✦ $app instalado correctamente"
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
    fi
done

for app in "${OPTIONAL_CLI_APPS[@]}"; do
    echo ""
    echo "=> Validando $app"
    if is_installed "$app"; then
        echo "✦ $app ya se encuentra instalado"
    else
        while true; do
            read "install_app?✦ ¿Quieres instalar $app? [y/n]: "
            case "$install_app" in
                [yY])
                    echo ""
                    echo "=> Instalando $app"
                    brew install "$app"
                    echo "✦ $app instalado correctamente"
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
    fi
done

echo ""
echo "✦ Todas las aplicaciones de terminal deseadas han sido procesadas"