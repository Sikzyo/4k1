DOTFILE_DIR="$HOME/.dotfile"

echo "✦ Configuración de skills"

echo ""
echo "✦ Validando carpetas"

# OpenCode - Codex - Cursor - Vscode - Copilot cli - warp - zed
mkdir -p "$HOME/.agents"

# Claude
mkdir -p "$HOME/.claude"

# Antigravity cli
mkdir -p "$HOME/.gemini/antigravity-cli"

# Antigravity ide
mkdir -p "$HOME/.gemini/antigravity"

echo ""
echo "✦ Instalando skills"


rm -rf "$HOME/.agents/skills" && cp -R "$DOTFILE_DIR/mac/skills" "$HOME/.agents/skills"
rm -rf "$HOME/.claude/skills" && cp -R "$DOTFILE_DIR/mac/skills" "$HOME/.claude/skills"
rm -rf "$HOME/.gemini/antigravity-cli/skills" && cp -R "$DOTFILE_DIR/mac/skills" "$HOME/.gemini/antigravity-cli/skills"
rm -rf "$HOME/.gemini/antigravity/skills" && cp -R "$DOTFILE_DIR/mac/skills" "$HOME/.gemini/antigravity/skills"

echo ""
echo "✦ Skills instaladas correctamente"
