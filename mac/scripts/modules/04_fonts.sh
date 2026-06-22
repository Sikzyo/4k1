FONTS=("font-monaspace" "font-cascadia-code" "font-jetbrains-mono" "font-google-sans-code")
SELECTED_FONTS=()

echo "✦ Modulo fuentes ✦"
set -e

sleep 0.5

echo ""
echo "✦ Selecciona las fuentes que quieres instalar en tu sistema"

sleep 0.5

for font in "${FONTS[@]}"; do
    echo ""
    read -p "✦ ¿Quieres instalar la fuente '$font'? [y/n]: " add_font

    sleep 0.3

    case "$add_font" in
        [yY])
            SELECTED_FONTS+=("$font")
        ;;
        [nN])
        ;;
        *)
            echo ""
            echo "=> Opción no valida, por favor presiona 'y' o 'n'"
        ;;
    esac
done

echo ""
echo "✦ Las fuentes que se van a instalar en el sistema son:"

echo ""
for select_font in "${SELECTED_FONTS[@]}"; do
    echo "✦ $select_font"
done