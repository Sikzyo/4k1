DOTFILE_DIR="$HOME/.4k1/mac/scripts"

option_menu(){
    echo ""
    echo "--------------"
    echo "Menu de opciones"
    echo "1) Instalación completa"
    echo "2) Salir"
    echo "--------------"
}

confirmation_message(){
    local name="$1"
    local next_step="$2"

    while true; do
        read -p "=> Seleccionaste la opción $name ¿Deseas continuar? [y/n]: " confirm_option

        echo ""
        case $confirm_option in
            [yY])
                echo ""
                echo "=> Iniciando $name..."
                sleep 0
                echo ""
                bash "$next_step"
                return 0
            ;;
            [nN])
                echo ""
                echo "=> Regresando al menu principal"
                sleep 0
                return 1
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
            ;;
        esac
    done     
}

echo "✦ Instalador para Mac ✦"
set -e

sleep 0

while true; do
    option_menu
    echo ""
    read -p "✦ Selecciona una opción: " selected_option

    echo ""
    case $selected_option in
    "1")
        echo ""
        if confirmation_message "Instalación completa" "$DOTFILE_DIR/full_install.sh"; then
            break
        fi
    ;;
    "2")
        echo ""
        echo "=> Saliendo del instalador"
        break
    ;;
    *)
        echo ""
        echo "=> Opción no valida, por favor intenta nuevamente"
        sleep 0
    ;;
    esac
done