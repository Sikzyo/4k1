#!/usr/bin/env zsh

echo "✦ Modulo Docker ✦"
setopt errexit

echo ""
echo "=> Validando si Docker esta instalado"

if command -v docker &> /dev/null; then
    echo ""
    echo "✦ Docker ya se encuentra instalado"
else
    echo ""
    echo "=> Instalando Docker"

    brew install --cask docker-desktop

    echo ""
    echo "✦ Docker instalado correctamente"
fi
