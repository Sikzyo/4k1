#!/usr/bin/env zsh

setopt errexit

ANTIGRAVITY_CLI_DIR="$HOME/.gemini/antigravity-cli/skills/"
SKILLS_DIR="${0:A:h:h:h}/skills" 
ALL_SKILLS=("$SKILLS_DIR"/*(N))

echo "✦ Configuraciones para Antigravity CLI ✦"

if ! command -v agy &> /dev/null; then
    echo ""
    echo "✦ Antigravity CLI no se encuentra instalado"
    exit 0
fi

if [[ -d "$ANTIGRAVITY_CLI_DIR" ]]; then
  echo ""
  echo "Limpiando carpetas"
 
  rm -rf "$ANTIGRAVITY_CLI_DIR"
fi

echo ""
echo "Creando carpeta para skills"

mkdir -p "$ANTIGRAVITY_CLI_DIR"

echo ""
echo "Clonando skills"

for skill in "$ALL_SKILLS[@]"; do
    cp -r "$skill" "$ANTIGRAVITY_CLI_DIR"
done
