echo "✦ Iniciando instalación de Homebrew"

echo ""
if command -v brew &> /dev/null; then
    echo ""
    echo "✦ Homebrew ya se encuentra instalado"
else
    echo ""
    echo "✦ Descargando homebrew"

    echo ""
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo ""
    if ! grep -q "brew shellenv" "$HOME/.zprofile"; then
        echo >> "$HOME/.zprofile"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> "$HOME/.zprofile"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"

    echo ""
    brew --version

    echo ""
    echo "✦ Homebrew se instalo correctamente"
fi