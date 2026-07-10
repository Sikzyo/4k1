#!/usr/bin/env zsh

echo "✦ Tema de color para Micro ✦"
set -e

THEME_DIR="$1"

echo ""
echo "=> Validando instalación de micro"
if ! command -v micro &> /dev/null; then
    echo ""
    echo "✦ Micro no se encuentra instalado"
    exit 0
fi

echo ""
echo "=> Creando carpeta para temas"

mkdir -p "$HOME/.config/micro/colorschemes"

echo ""
echo "=> Copiando tema para Micro"

cp "$THEME_DIR/default-theme.micro" "$HOME/.config/micro/colorschemes"