echo "✦ Configurar fuentes"

if brew list font-monaspace &> /dev/null; then
    echo ""
    echo "✦ Fuentes ya instaladas"
else
    echo ""
    echo "✦ Instalando fuente monaspace de GitHub"

    echo ""
    brew install --cask font-monaspace

    echo ""
    echo "✦ Fuentes instaladas correctamente"
fi