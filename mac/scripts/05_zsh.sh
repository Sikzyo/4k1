DOTFILE_DIR="$HOME/.dotfile"

echo "✦ Configuración de zsh"

echo ""
echo "✦ Aplicando configuraciones de zsh"

mkdir -p "$HOME/.config/zsh"
cp "$DOTFILE_DIR"/mac/config/zsh/*.zsh "$HOME/.config/zsh/"

rm -f "$HOME/.zshrc" && cp "$DOTFILE_DIR/mac/config/zsh/.zshrc" "$HOME/.zshrc"


echo ""
echo "✦ zsh configurado correctamente"
