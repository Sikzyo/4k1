#!/usr/bin/env zsh

DEV_PLATFORMS=("Android" "IOS")
SELECT_DEV_PLATFORMS=()

ios_config() {
    echo "✦ Para poder realizar la configuración para IOS es necesario que instale Xcode"
    
    while true; do
        read "open_install_xcode?✦ ¿Desear abrir la App Store para instalar xcode? [y/n]: "
        case "$open_install_xcode" in
            [yY])
                open -a "App Store" 
                break
            ;;
            [nN])
                exit 1
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
            ;;
        esac
    done

    echo "=> Validando Xcode"

    echo ""
    while true; do
        if ! ls /Applications | grep -i -q "Xcode"; then
            echo "✦ Se requiere tener instalado Xcode para poder continuar"
            echo "✦ Instala Xcode para poder continuar..."
            sleep 5
        else
            echo "✦ Xcode instalado correctamente"
            break
        fi
    done

    echo ""
    echo "=> Iniciando configuración para desarrollo IOS"

    sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
    sudo xcodebuild -license
    xcodebuild -downloadPlatform iOS

    if brew list cocoapods &> /dev/null; then
        echo ""
        echo "✦ Cocoapods ya esta instalado"
    else
        echo ""
        echo "=> Instalando Cocoapods"

        brew install cocoapods

        echo ""
        echo "✦ Cocoapods instalado correctamente"
    fi

    flutter doctor

    echo ""
    echo "✦ Dependencias para desarrollo IOS instaladas correctamente"
}

android_config() {
    echo "✦ Para poder realizar la configuración para Android es necesario que instale Android Studio"
    
    app_path="/Applications/Android Studio.app"
    if [ -d "$app_path" ]; then
        echo ""
        echo "✦ Android Studio ya esta instalado"
    else
        echo ""
        echo "=> Instalando Android Studio"

        brew install --cask android-studio

        echo ""
        echo "✦ Android Studio instalado correctamente"
    fi

    echo "✦ Se va a abrir Android Studio"
    echo "✦ Abre el SDK Manager"
    echo "✦ Configura el SDK Tool"
    echo "✦ Debes tener instalado: Android SDK Command-line Tools"
    echo "✦ Es super importante realizar esto para poder continuar"

    sleep 5

    open -a "Android Studio"
    
    echo ""
    read "?✦ Presiona cualquier tecla para continuar con la instalación"

    echo ""
    echo "=> Aceptando licencia de Android Studio"

    flutter doctor --android-licenses

    flutter doctor

    echo ""
    echo "✦ Dependencias para desarrollo Android instaladas correctamente"
}

echo "✦ Modulo Flutter ✦"
set -e

echo ""
echo "=> Validando instalación de Flutter"

if command -v flutter &> /dev/null; then
    echo ""
    echo "✦ Flutter ya se encuentra instalado"
else
    echo ""
    echo "=> Instalando Flutter"

    brew install --cask flutter

    echo ""
    echo "✦ Flutter instalado correctamente"
fi

echo ""
echo "=> Ejecutando Flutter Doctor"

flutter doctor

echo ""
echo "✦ Vamos a configurar las plataformas de desarrollo para Flutter"
echo "✦ Selecciona las que quieras instalar y configurar"

for dev_platform in "${DEV_PLATFORMS[@]}"; do
    while true; do
        echo ""
        read "add_dev_platform?✦ ¿Quieres configurar $dev_platform? [y/n]: "

        case "$add_dev_platform" in
            [yY])
                SELECT_DEV_PLATFORMS+=("$dev_platform")
                break
            ;;
            [nN])
                break
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
            ;;
        esac
    done
done

if [ ${#SELECT_DEV_PLATFORMS[@]} -eq 0 ]; then
    echo ""
    echo "✦ No se selecciono ninguna plataforma"
else
    for select_dev_platform in "${SELECT_DEV_PLATFORMS[@]}"; do
        echo ""

        case "$select_dev_platform" in
            "Android")
                android_config
            ;;
            "IOS")
                ios_config
            ;;
            *)
                echo ""
            ;;
        esac
    done
fi