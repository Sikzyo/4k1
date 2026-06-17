DOTFILE_DIR=~/.dotfile

if [ -d "$DOTFILE_DIR/mac/.config/zsh" ]; then
    for file in "$DOTFILE_DIR/mac/.config/zsh"/*.zsh; do
        source "$file"
    done
fi