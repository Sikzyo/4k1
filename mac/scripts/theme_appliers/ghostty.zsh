#!/usr/bin/env zsh

echo "✦ Tema de color para Ghostty ✦"
setopt errexit

THEME_DIR="$1"
GHOSTTY_DIR="$HOME/.config/ghostty/themes"

echo ""
echo "=> Validando instalación de Ghostty"
if ! brew list ghostty &> /dev/null; then
    echo ""
    echo "✦ Ghostty no se encuentra instalado"
    exit 1
fi

echo ""
echo "=> Creando carpeta para temas"

mkdir -p "$GHOSTTY_DIR"

echo ""
echo "=> Copiando tema para Ghostty"

cp "$THEME_DIR/default-theme.conf" "$GHOSTTY_DIR"