#!/usr/bin/env zsh

JS_TOOLS=("node" "pnpm" "bun")

echo "✦ Modulo JavaScript ✦"
setopt errexit

for tool in "${JS_TOOLS[@]}"; do
    echo ""
    echo "=> Validando si $tool esta instalado"

    if command -v "$tool" &> /dev/null; then
        echo ""
        echo "✦ $tool ya se encuentra instalado"
    else
        echo ""
        echo "=> Instalando $tool"

        brew install "$tool"

        echo ""
        echo "✦ $tool instalado correctamente"
    fi
done

echo ""
echo "✦ Todas las herramientas de JavaScript fueron instaladas correctamente"