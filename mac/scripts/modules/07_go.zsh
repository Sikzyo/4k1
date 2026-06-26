#!/usr/bin/env zsh

echo "✦ Modulo Go ✦"
set -e

echo ""
echo "=> Validando si esta instalado Go"

if command -v go &> /dev/null; then
    echo ""
    echo "✦ Go ya se encuentra instalado"
else
    echo ""
    echo "=> Instalando Go"

    brew install go

    echo ""
    echo "✦ Go instalado correctamente"
fi

