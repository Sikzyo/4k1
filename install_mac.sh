echo "✦ Inicio de configuración para MacOs"
set -e

if ! xcode-select -p &> /dev/null; then
    echo ""
    echo "✦ Instalando Xcode Command Line Tools" 

    xcode-select --install

    echo ""
    echo "✦ Se ha abierto una ventana del sistema macOS."
    echo "✦ Ve a esa ventana y completa la instalación."
    echo "✦ Cuando la instalación haya terminado, regresa aquí."

    while pgrep -f "Install Command Line Developer Tools" &> /dev/null; do
        sleep 5
    done

    echo ""
    echo "✦ ¡Linea de comandos instalada correctamente!"
fi

DOTFILE_DIR="$HOME/.dotfile"

if [ ! -d "$DOTFILE_DIR" ]; then
    echo ""
    echo "✦ Clonando repositorio"
    git clone https://github.com/Sikzyo/4k1.git "$DOTFILE_DIR"
else
    echo ""
    echo "✦ El repositorio ya existe, actualizando..."
    cd "$DOTFILE_DIR"
    echo ""
    git pull origin main
fi

cd "$DOTFILE_DIR"
if [ -f "mac/install.sh" ]; then
    echo ""
    echo "✦ Iniciando instalador de Mac"
    echo ""
    bash mac/install.sh
else
    echo "Error al iniciar el instalador"
    exit 1
fi