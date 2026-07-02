#!/usr/bin/env zsh

echo "✦ Modulo Homebrew ✦"
set -e

echo ""
echo "=> Validando si esta instalado Homebrew"

if command -v brew &> /dev/null; then
    echo ""
    echo "✦ Homebrew ya se encuentra instalado"
else
    echo ""
    echo "✦ Iniciando descarga de Homebrew"

    echo ""
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    touch "$HOME/.zprofile"

    if ! grep -q "brew shellenv" "$HOME/.zprofile"; then
        echo >> "$HOME/.zprofile"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> "$HOME/.zprofile"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"

    echo ""
    echo "=> Confirmando si se instalo correctamente Homebrew"

    if ! command -v brew &> /dev/null; then
        echo ""
        echo "✦ La instalación presento un error"
        exit 1
    fi 

    echo ""
    echo "✦ Homebrew se instalo correctamente"
fi
