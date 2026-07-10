#!/usr/bin/env zsh

setopt errexit

CONFIG_DIR="${0:A:h:h:h}/config/neovim"

echo "✦ Configuraciones para Neovim ✦"

if ! command -v nvim &> /dev/null; then
    echo ""
    echo "✦ Neovim no se encuentra instalado"
    exit 0
fi

echo ""
echo "=> configurando Neovim"

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

mkdir -p ~/.config/nvim/lua/plugins
cp "$CONFIG_DIR/plugins/mason.lua" ~/.config/nvim/lua/plugins/
