echo "✦ Configuración de Flutter"

if command -v flutter &> /dev/null; then
    echo ""
    echo "✦ Flutter ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando Flutter mediante Homebrew"

    echo ""
    brew install --cask flutter

    echo ""
    echo "✦ Flutter instalado correctamente"
fi

echo ""
echo "✦ Desactivando telemetría de Google"

echo ""
flutter --disable-analytics

if brew list cocoapods &> /dev/null; then
    echo ""
    echo "✦ CocoaPods ya se encuentra instalado"
else
    echo ""
    echo "✦ Instalando CocoaPods mediante Homebrew"

    echo ""
    brew install cocoapods

    echo ""
    echo "✦ CocoaPods instalado correctamente"
fi

echo ""
echo "✦ Flutter y dependencias para desarrollo en IOS instaladas correctamente"

echo ""
echo "✦ Posteriormente se instalaran las dependencias para desarrollo Android"