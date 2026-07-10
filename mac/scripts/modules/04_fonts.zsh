#!/usr/bin/env zsh

FONTS=("font-monaspace" "font-cascadia-code" "font-jetbrains-mono" "font-google-sans-code")
SELECTED_FONTS=()

echo "✦ Modulo fuentes ✦"
setopt errexit

echo ""
echo "✦ Selecciona las fuentes que quieres instalar en tu sistema"

for font in "${FONTS[@]}"; do
    while true; do
        echo ""
        read "add_font?✦ ¿Quieres instalar la fuente '$font'? [y/n]: " 

        case "$add_font" in
            [yY])
                SELECTED_FONTS+=("$font")
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

echo ""
if [ ${#SELECTED_FONTS[@]} -eq 0 ]; then
    echo "✦ No se seleccionó ninguna fuente para instalar."
else
    echo "✦ Las fuentes que se van a instalar en el sistema son:"
    echo ""
    for select_font in "${SELECTED_FONTS[@]}"; do
        echo "✦ $select_font"
    done

    echo ""
    echo "✦ Vamos a iniciar con el proceso de instalación de las fuentes"

    for select_font in "${SELECTED_FONTS[@]}"; do
        echo ""
        echo "=> Instalando $select_font"

        brew install --cask "$select_font"

        echo ""
        echo "✦ Fuente instalada correctamente"
    done

    echo ""
    echo "✦ Todas las fuentes seleccionadas fueron instaladas correctamente"
fi