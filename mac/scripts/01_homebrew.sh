user=$(whoami)

echo "✦ Iniciando instalación de Homebrew"

echo ""
if brew --version 2> /dev/null; then
    echo ""
    echo "✦ Homebrew ya se encuentra instalado"
else
    echo ""
    echo "✦ Descargando homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo ""
    echo "✦ Agregando homebrew a tu PATH"
    echo >> /Users/$user/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/$user/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
    echo ""
    brew --version
    echo ""
    echo "✦ Homebrew se instalo correctamente"
fi