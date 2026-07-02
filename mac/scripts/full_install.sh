#!/usr/bin/env zsh

# MODULES_DIR="$HOME/.4k1/mac/scripts/modules"
MODULES_DIR="$HOME/Develop/4k1/mac/scripts/modules"

set -E
set -e

alert_error() {
    echo ""
    echo "=> La ejecución se detuvo porque un modulo o comando fallo"
    echo "=> Saliendo de la instalación"
}

trap alert_error ERR

echo "=> Cargando modulo 1°..."

echo ""
zsh "$MODULES_DIR/01_homebrew.sh"

source ~/.zprofile

echo ""
echo "=> Cargando modulo 2°..."

echo ""
zsh "$MODULES_DIR/02_git.sh"

echo ""
echo "=> Cargando modulo 3°..."

echo ""
zsh "$MODULES_DIR/03_ssh.sh"

echo ""
echo "=> Cargando modulo 4°..."

echo ""
zsh "$MODULES_DIR/04_fonts.sh"

echo ""
echo "=> Cargando modulo 5°..."

echo ""
zsh "$MODULES_DIR/05_zsh.sh"

echo ""
echo "=> Cargando modulo 6°..."

echo ""
zsh "$MODULES_DIR/06_js.zsh"

echo ""
echo "=> Cargando modulo 7°..."

echo ""
zsh "$MODULES_DIR/07_go.zsh"

echo ""
echo "=> Cargando modulo 8°..."

echo ""
zsh "$MODULES_DIR/08_flutter.zsh"

echo ""
echo "=> Cargando modulo 9°..."

echo ""
zsh "$MODULES_DIR/09_docker.zsh"

echo ""
echo "=> Cargando modulo 10°..."

echo ""
zsh "$MODULES_DIR/10_terminal_apps.zsh"

echo ""
echo "=> Cargando modulo 11°..."

echo ""
zsh "$MODULES_DIR/11_gui_apps.zsh"