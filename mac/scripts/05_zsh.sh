DOTFILE_DIR=~/.dotfile

echo "✦ Configuración de zsh"

echo ""
echo "✦ Aplicando configuraciones de zsh"

ln -sf "$DOTFILE_DIR/mac/config/zsh/.zshrc" "$HOME/.zshrc"

echo ""
echo "✦ zsh configurado correctamente"