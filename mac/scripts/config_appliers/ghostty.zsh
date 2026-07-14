#!/usr/bin/env zsh

setopt errexit

COLOR_THEME_DIR="$HOME/.config/ghostty/themes"
GHOSTTY_DIR="$HOME/.config/ghostty"
CONFIG_DIR="${0:A:h:h:h}/config/ghostty"

echo "✦ Configuraciones para Ghostty ✦"

if ! brew list ghostty &> /dev/null; then
    echo ""
    echo "✦ Ghostty no se encuentra instalado"
    exit 1
fi

mkdir -p "$GHOSTTY_DIR" "$COLOR_THEME_DIR"

if [[ ! -f "$COLOR_THEME_DIR/default-theme.conf" ]]; then
    touch "$COLOR_THEME_DIR/default-theme.conf"
fi

echo ""
echo "=> Aplicando configuraciones"

cp "$CONFIG_DIR/config.ghostty" "$GHOSTTY_DIR/"