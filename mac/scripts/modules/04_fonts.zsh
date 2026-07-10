#!/usr/bin/env zsh

echo "✦ Modulo fuentes ✦"
setopt errexit

echo ""
echo "=> Validando si JetBrains Mono Nerd Font esta instalada"

if brew list --cask font-jetbrains-mono-nerd-font &> /dev/null; then
    echo ""
    echo "✦ JetBrains Mono Nerd Font ya se encuentra instalada"
else
    echo ""
    echo "=> Instalando JetBrains Mono Nerd Font"

    brew install --cask font-jetbrains-mono-nerd-font

    echo ""
    echo "✦ Fuente instalada correctamente"
fi