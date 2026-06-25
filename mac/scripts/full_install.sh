#!/usr/bin/env zsh

MODULES_DIR="$HOME/.4k1/mac/scripts/modules"

set -E
set -e

alert_error() {
    echo ""
    echo "=> La ejecución se detuvo porque un modulo o comando fallo"
    echo "=> Saliendo de la instalación"
}

trap alert_error ERR

echo "=> Cargando primer modulo..."

echo ""
zsh "$MODULES_DIR/01_homebrew.sh"

source ~/.zprofile

echo ""
echo "=> Cargando segundo modulo..."

echo ""
zsh "$MODULES_DIR/02_git.sh"

echo ""
echo "=> Cargando tercer modulo..."

echo ""
zsh "$MODULES_DIR/03_ssh.sh"

echo ""
echo "=> Cargando cuarto modulo..."

echo ""
zsh "$MODULES_DIR/04_fonts.sh"

echo ""
echo "=> Cargando quinto modulo..."

echo ""
zsh "$MODULES_DIR/05_zsh.sh"