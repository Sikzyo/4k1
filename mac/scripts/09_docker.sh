echo "✦ Configuración de Docker"

if command -v docker &> /dev/null; then
    echo ""
    echo "✦ Docker ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando Docker mediante Homebrew"

    echo ""
    brew install --cask docker-desktop

    echo ""
    echo "✦ Docker instalado correctamente"
fi