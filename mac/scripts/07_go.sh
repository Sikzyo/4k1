echo "✦ Configuración de Go"

if command -v go &> /dev/null; then
    echo ""
    echo "✦ Go ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando Go mediante Homebrew"

    echo ""
    brew install go

    echo ""
    echo "✦ Go instalado correctamente"
fi