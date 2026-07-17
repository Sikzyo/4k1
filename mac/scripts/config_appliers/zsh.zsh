#!/usr/bin/env zsh

DOTFILE_DIR="${0:A:h:h:h}/config/zsh"

setopt errexit

echo "✦ Configuraciones para zsh ✦"

echo ""
echo "=> Creando carpeta .zsh"

rm -rf "$HOME/.config/zsh"
mkdir -p "$HOME/.config/zsh"

echo ""
echo "=> Copiando configuración de zsh"

cp "$DOTFILE_DIR"/*.zsh "$HOME/.config/zsh"

echo ""
echo "=> Actualizando archivo .zshrc"

rm -f "$HOME/.zshrc"
cp "$DOTFILE_DIR/.zshrc" "$HOME"