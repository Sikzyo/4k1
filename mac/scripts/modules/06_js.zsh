#!/usr/bin/env zsh

JS_TOOLS=("node" "pnpm" "bun")
SELECTED_JS_TOOLS=()

echo "✦ Modulo JavaScript ✦"
setopt errexit

echo ""
echo "✦ Selecciona las herramientas de JavaScript que quieras instalar"

for tool in "${JS_TOOLS[@]}"; do
    while true; do
        echo ""
        read "add_tool?✦ ¿Quieres instalar $tool? [y/n]: "

        case "$add_tool" in
            [yY])
                SELECTED_JS_TOOLS+=("$tool")
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
if [ ${#SELECTED_JS_TOOLS[@]} -eq 0 ]; then
    echo "✦ No se seleccionó ninguna herramienta de JavaScript para instalar"
else
    echo "✦ Iniciando proceso de instalación de las herramientas seleccionadas"

    for selected_tool in "${SELECTED_JS_TOOLS[@]}"; do
        echo ""
        echo "=> Instalando $selected_tool"

        brew install "$selected_tool"

        echo ""
        echo "✦ $selected_tool instalada correctamente"
    done

    echo ""
    echo "✦ Todas las herramientas de JavaScript fueron instaladas correctamente"
fi