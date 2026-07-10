#!/usr/bin/env zsh

setopt errexit

COLOR_THEME_DIR="$HOME/.config/micro/colorschemes"
MICRO_DIR="$HOME/.config/micro"
CONFIG_DIR="${0:A:h:h:h}/config/micro"

echo "✦ Configuraciones para Micro ✦"

if ! command -v micro &> /dev/null; then
    echo ""
    echo "✦ Micro no se encuentra instalado"
    exit 0
fi

if [[ ! -f "$COLOR_THEME_DIR/default-theme.micro" ]]; then
    touch "$COLOR_THEME_DIR/default-theme.micro"
fi

echo ""
echo "=> Aplicando configuraciones"

cp "$CONFIG_DIR/settings.json" "$MICRO_DIR"

