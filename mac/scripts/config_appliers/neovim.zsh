#!/usr/bin/env zsh

setopt errexit

CONFIG_DIR="${0:A:h:h:h}/config/neovim"

echo "✦ Configuraciones para Neovim ✦"

if ! command -v nvim &> /dev/null; then
    echo ""
    echo "✦ Neovim no se encuentra instalado"
    exit 1
fi

echo ""
echo "=> configurando Neovim"

if [[ -d "$HOME/.config/nvim" ]]; then
    echo ""
    echo "=> Limpiando configuración antigua de Neovim"
    rm -rf "$HOME/.config/nvim"
fi

echo ""
echo "=> Clonando repositorio de Lazyvim"

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git
rm ~/.config/nvim/.gitignore

echo ""
echo "=> Agregando configuración personalizada"

mkdir -p ~/.config/nvim/lua/plugins
cp "$CONFIG_DIR/plugins/mason.lua" ~/.config/nvim/lua/plugins/
