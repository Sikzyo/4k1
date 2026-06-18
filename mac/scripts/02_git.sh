git_username=$(git config --global user.name)
git_email=$(git config --global user.email)

echo "✦ Iniciando configuración de git"

echo ""
if brew list git &> /dev/null; then
    echo ""
    echo "✦ Git instalado mediante Homebrew"
else
    echo ""
    echo "✦ Instalando git mediante homebrew"

    brew install git

    echo ""
    echo "✦ Git instalado exitosamente"
fi

echo ""
echo "✦ Configuración inicial de git"

if [ -n "$git_username" ]; then
    echo ""
    echo "✦ Actualmente esta configurado el nombre: $git_username"

    echo ""
    read -p "¿Deseas modificarlo? [y/n]" update_username

    case "$update_username" in
        [yY])
            echo ""
            read -p "✦ Por favor ingresa el nombre que se va a registrar en git: " new_username
            git config --global user.name "$new_username"
        ;;
        *)
            echo ""
            echo "Se conserva el nombre: $git_username"
        ;;
    esac
else
    echo ""
    read -p "✦ Por favor ingresa el nombre que se va a registrar en git: " new_username
    git config --global user.name "$new_username"
fi

if [ -n "$git_email" ]; then
    echo ""
    echo "✦ Actualmente esta configurado el correo: $git_email"

    echo ""
    read -p "¿Deseas modificarlo? [y/n]" update_email

    case "$update_email" in
        [yY])
            echo ""
            read -p "✦ Por favor ingresa tu correo electrónico: " new_email
            git config --global user.email "$new_email"
        ;;
        *)
            echo ""
            echo "Se conserva el correo: $git_email"
        ;;
    esac
else
    echo ""
    read -p "✦ Por favor ingresa tu correo electrónico: " new_email
    git config --global user.email "$new_email"
fi

echo ""
echo "✦ Configurando el nombre de la rama por defecto"
git config --global init.defaultBranch main

echo ""
echo "✦ Tu configuración de git es la siguiente:"

echo ""
echo "✦ Nombre de usuario: $(git config --global user.name)"

echo ""
echo "✦ Correo: $(git config --global user.email)"

echo ""
echo "✦ Nombre de rama por defecto:$(git config --global init.defaultBranch)"

echo ""
echo "✦ Git configurado exitosamente"
