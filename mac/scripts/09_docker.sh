echo "✦ Configuración de Docker"

if [ -d "/Applications/Docker.app" ] || command -v docker &> /dev/null; then
    echo ""
    echo "✦ Docker ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando Docker Desktop mediante Homebrew"

    echo ""
    brew install --cask docker

    echo ""
    echo "✦ Docker Desktop instalado correctamente"
fi