echo "✦ Iniciando instalación de Xcode Command Line Tools"
echo ""

if xcode-select --install; then
    echo ""
    echo "✦ Se ha abierto una ventana del sistema macOS."
    echo "✦ Ve a esa ventana y completa la instalación."
    echo "✦ Cuando la instalación haya terminado, regresa aquí."
    while pgrep -f "Install Command Line Developer Tools" &> /dev/null; do
        sleep 5
    done
    echo ""
    echo "✦ ¡Linea de comandos instalada correctamente!"
else
    echo ""
    echo "✦ La linea de comandos ya se encuentra instalada."
fi