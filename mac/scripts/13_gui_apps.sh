gui_apps=("affinity" "brave-browser" "chatgpt" "claude" "discord" "figma" "google-gemini" "notion" "obsidian" "ollama-app" "spotify" "steam" "tidal" "yaak" "zen")
selected_gui_apps=()
DOTFILE_DIR="$HOME/.dotfile"

echo "✦ Instalación de aplicaciones"

for gui in "${gui_apps[@]}"; do
    echo ""
    read -p "✦ ¿Quieres instalar $gui? [y/n]: " install_gui_app

    case "$install_gui_app" in
        [yY])
            selected_gui_apps+=("$gui")
        ;;
        *)
        ;;
    esac
done

for selected in "${selected_gui_apps[@]}"; do
    case "$selected" in
        "affinity")
            app_path="/Applications/Affinity.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask affinity

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "brave-browser")
            app_path="/Applications/Brave Browser.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask brave-browser

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "chatgpt")
            app_path="/Applications/ChatGPT.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask chatgpt

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "claude")
            app_path="/Applications/Claude.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask claude

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "discord")
            app_path="/Applications/Discord.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask discord

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "figma")
            app_path="/Applications/Figma.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask figma

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "google-gemini")
            app_path="/Applications/Gemini.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask google-gemini

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "notion")
            app_path="/Applications/Notion.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask notion

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "obsidian")
            app_path="/Applications/Obsidian.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask obsidian

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "ollama-app")
            app_path="/Applications/Ollama.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask ollama-app

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "spotify")
            app_path="/Applications/Spotify.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask spotify

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "steam")
            app_path="/Applications/Steam.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask steam

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "tidal")
            app_path="/Applications/Tidal.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask tidal

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "yaak")
            app_path="/Applications/Yaak.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask yaak

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        "zen")
            app_path="/Applications/Zen.app"
            if [ -d "$app_path" ]; then
                echo ""
                echo "✦ Ya tienes instalado $selected"
            else
                echo ""
                echo "✦ Instalando $selected"

                echo ""
                brew install --cask zen

                echo ""
                echo "✦ Se instalo correctamente $selected"
            fi
        ;;
        *)
            echo ""
            echo "✦ No hay más aplicaciones por instalar"
        ;;
    esac
done

echo ""
echo "✦ Aplicaciones instaladas exitosamente."
