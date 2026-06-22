# MODULES_DIR="$HOME/.4k1/mac/scripts/modules"
MODULES_DIR="$HOME/Develop/4k1/mac/scripts/modules"

set -E
set -e

alert_error() {
    echo ""
    echo "=> La ejecución se detuvo porque un modulo o comando fallo"
    echo "=> Saliendo de la instalación"
    sleep 3
}

trap alert_error ERR

echo "=> Cargando primer modulo..."

sleep 0.5

echo ""
bash "$MODULES_DIR/01_homebrew.sh"

source ~/.zprofile

echo ""
echo "=> Cargando segundo modulo..."

sleep 0.5

echo ""
bash "$MODULES_DIR/02_git.sh"

echo ""
echo "=> Cargando tercer modulo..."

sleep 0.5

echo ""
bash "$MODULES_DIR/03_ssh.sh"

echo ""
echo "=> Cargando cuarto modulo..."

sleep 0.5

echo ""
bash "$MODULES_DIR/04_fonts.sh"