echo "✦ Modulo Homebrew ✦"
set -e

sleep 0.5

echo ""
echo "=> Validando si esta instalado Homebrew"

sleep 0.5

if command -v brew &> /dev/null; then
    echo ""
    echo "✦ Homebrew ya se encuentra instalado"
else
    echo ""
    echo "✦ Iniciando descarga de Homebrew"

    sleep 0.5

    echo ""
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    sleep 0.5

    touch "$HOME/.zprofile"

    if ! grep -q "brew shellenv" "$HOME/.zprofile"; then
        echo >> "$HOME/.zprofile"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> "$HOME/.zprofile"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"

    sleep 0.5

    echo ""
    echo "=> Confirmando si se instalo correctamente Homebrew"

    sleep 0.5

    if ! command -v brew &> /dev/null; then
        echo ""
        echo "✦ La instalación presento un error"
        exit 1
    fi 

    echo ""
    echo "✦ Homebrew se instalo correctamente"
fi
