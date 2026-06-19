ZSH_CONFIG_DIR="$HOME/.config/zsh"

if [ -d "$ZSH_CONFIG_DIR" ]; then
    for file in "$ZSH_CONFIG_DIR"/*.zsh; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
fi