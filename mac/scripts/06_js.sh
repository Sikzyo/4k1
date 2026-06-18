echo "✦ Configuración de entorno para Node y Bun"

if command -v node &> /dev/null; then
    echo ""
    echo "✦ Node ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando Node mediante Homebrew"

    echo ""
    brew install node

    echo ""
    echo "✦ Node instalado correctamente"
fi

if command -v pnpm &> /dev/null; then
    echo ""
    echo "✦ Pnpm ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando pnpm mediante Homebrew"

    echo ""
    brew install pnpm

    echo ""
    echo "✦ pnpm instalado correctamente"
fi

if command -v bun &> /dev/null; then
    echo ""
    echo "✦ Bun ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando Bun mediante Homebrew"

    echo ""
    brew install bun

    echo ""
    echo "✦ Bun instalado correctamente"
fi

echo ""
echo "✦ Node, pnpm y Bun instalados exitosamente"
