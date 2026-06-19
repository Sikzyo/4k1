USER_OS="Indefinido"

case $OSTYPE in
    "darwin"*)
        USER_OS="Maco"
    ;;
    "linux"*)
        USER_OS="Linux"
    ;;
    *)
        USER_OS="Sistema no soportado"
    ;;
esac

echo "✦ Preparando instalación"

set -e

echo ""
echo "✦ Vamos a validar tu sistema operativo primero"

echo ""
echo "=> Validando sistema..."

sleep 1

echo ""
echo "✦ Tu sistema operativo es: $USER_OS"

sleep 1

echo ""
case "$USER_OS" in
    "Mac")
        echo "=> Iniciando instalador para Mac..."
        echo ""
        sleep 2
        bash bash mac/install.sh
    ;;
    "Linux")
        echo "=> Actualmente estamos trabajando en el soporte para Linux, esperamos lanzarlo lo mas pronto posible"
        sleep 2
        exit 1
    ;;
    *)
        echo "=> Actualmente no disponemos soporte para tu sistema operativo"
        sleep 2
        exit 1
    ;;
esac