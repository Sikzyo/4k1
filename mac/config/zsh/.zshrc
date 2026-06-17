DOTFILE_DIR="$HOME/.dotfile"

if [ -d "$DOTFILE_DIR/mac/config/zsh" ]; then
    for file in "$DOTFILE_DIR"/mac/config/zsh/*.zsh; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
fi