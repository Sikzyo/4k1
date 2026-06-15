echo ""
echo "✦ Iniciando configuración de git"
echo ""
if brew list git &> /dev/null; then
    echo ""
    echo "✦ Git instalado mediante Homebrew"
else
    echo ""
    echo "✦ Actualizando homebrew"
    echo ""
    brew update
    echo ""
    brew upgrade
    echo ""
    echo "✦ Instalando git mediante homebrew"
    brew install git
    echo ""
    echo "✦ Git instalado exitosamente"
fi

echo ""
echo "✦ Configuración inicial de git"

echo ""
read -p "✦ Por favor ingresa el nombre que se va a registrar en git: " user_name
git config --global user.name "$user_name"

echo ""
read -p "✦ Por favor ingresa tu correo electrónico: " user_email
git config --global user.email "$user_email"

echo ""
echo "✦ Configurando el nombre de la rama por defecto"
git config --global init.defaultBranch main

echo ""
echo "✦ Esta es tu configuración actual de git:"
git config --list

echo ""
echo "✦ Git configurado exitosamente"
