editors_available=("visual-studio-code" "cursor" "zed" "android-studio" "micro")
selected_editors=()
DOTFILE_DIR="$HOME/.dotfile"

echo "✦ Instalación de editores de código"

for editor in "${editors_available[@]}"; do
    echo ""
    read -p "✦ ¿Quieres instalar $editor? [y/n]: " install_editor

    case "$install_editor" in
    [yY])
        selected_editors+=("$editor")
        ;;
    *)
    ;;
    esac

done

for selected in "${selected_editors[@]}"; do
    case "$selected" in
    "visual-studio-code")
        app_path="/Applications/Visual Studio Code.app"
        if [ -d "$app_path" ]; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected..."

            echo ""
            brew install --cask visual-studio-code

            echo ""
            echo "✦ $selected instalado correctamente"
        fi
        ;;
    "cursor")
        app_path="/Applications/Cursor.app"
        if [ -d "$app_path" ]; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected..."

            echo ""
            brew install --cask cursor

            echo ""
            echo "✦ $selected instalado correctamente"
        fi

        echo ""
        echo "✦ Aplicando configuraciones"

        mkdir -p "$HOME/Library/Application Support/Cursor/User"

        ln -sf "$DOTFILE_DIR/mac/config/cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"

        ;;
    "zed")
        app_path="/Applications/Zed.app"
        if [ -d "$app_path" ]; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected..."

            echo ""
            brew install --cask zed

            echo ""
            echo "✦ $selected instalado correctamente"
        fi

        echo ""
        echo "✦ Aplicando configuraciones"

        mkdir -p "$HOME/.config/zed"

        ln -sf "$DOTFILE_DIR/mac/config/zed/settings.json" "$HOME/.config/zed/settings.json"
        ln -sf "$DOTFILE_DIR/mac/config/zed/keymap.json" "$HOME/.config/zed/keymap.json"

        ;;
    "android-studio")
        app_path="/Applications/Android Studio.app"
        if [ -d "$app_path" ]; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected..."

            echo ""
            brew install --cask android-studio

            echo ""
            echo "✦ $selected instalado correctamente"

            echo ""
            echo "✦ Abre Android Studio para terminar su configuración"

            echo ""
            echo "✦ Sigue el asistente de configuración"

            echo ""
            echo "✦ Asegúrate de instalar: Android SDK Command-line Tools (latest)"

            echo ""
            echo "✦ Cuando termine de realizar la instalación regresa a esta pantalla para continuar"

            echo ""
            open -a "Android Studio"

            echo ""
            read -p "✦ ¿Ya realizaste la instalación de android studio? [y/n]: " confirm_setup

            case "$confirm_setup" in
                [yY])
                    echo ""
                    echo "✦ Aceptando licencia de android"

                    echo ""
                    yes | flutter doctor --android-licenses

                    echo ""
                    echo ""
                    ;;
                *)
                    ;;
            esac

            echo ""
            echo "✦ Validando instalación de Flutter con Flutter Doctor"

            echo ""
            flutter doctor
        fi
        ;;
    "micro")
        if brew list micro &> /dev/null; then
            echo ""
            echo "✦ Ya tienes instalado $selected"
        else
            echo ""
            echo "✦ Instalando $selected..."

            echo ""
            brew install micro

            echo ""
            echo "✦ $selected instalado correctamente"
        fi
        ;;
    *)
        echo ""
        echo "✦ No hay mas editores por instalar"
        ;;
    esac
done

echo ""
echo "✦ Editores instalados exitosamente."