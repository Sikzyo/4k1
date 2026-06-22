echo "✦ Modulo Homebrew ✦"
set -e

sleep 1

echo ""
echo "=> Validando si esta instalado Homebrew"

sleep 1

if command -v brew &> /dev/null; then
    echo ""
    echo "✦ Homebrew ya se encuentra instalado"
else
    echo ""
    echo "✦ Iniciando descarga de Homebrew"

    sleep 1

    echo ""
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    sleep 1

    touch "$HOME/.zprofile"

    echo ""
    if ! grep -q "brew shellenv" "$HOME/.zprofile"; then
        echo >> "$HOME/.zprofile"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> "$HOME/.zprofile"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"

    sleep 1

    echo ""
    echo "=> Confirmando si se instalo correctamente Homebrew"

    sleep 1

    if ! command -v brew &> /dev/null; then
        echo ""
        echo "✦ La instalación presento un error"
        exit 1
    fi 

    echo ""
    echo "✦ Homebrew se instalo correctamente"
fi
