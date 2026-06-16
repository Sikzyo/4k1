echo "✦ Configurar claves SSH para GitHub"

echo ""
echo "✦ Generando clave SSH"

echo ""
read -p "✦ Por favor ingresa tu correo electrónico: " user_email

echo ""
# ssh-keygen -t ed25519 -C "$user_email"

echo ""
echo "✦ Iniciando agente SSH"

echo ""
# eval "$(ssh-agent -s)"

echo ""
echo "✦ Validando archivo de configuración"

if [ ! -f ~/.ssh/config ] &> /dev/null;  then

    echo ""
    echo ""
else
    echo ""
    echo "✦ Generando archivo de configuración"

    echo ""
    touch ~/.ssh/config
    echo "Host github.com" >> ~/.ssh/config
    echo "  User git" >> ~/.ssh/config
    echo "  AddKeysToAgent yes" >> ~/.ssh/config
    echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
fi

echo ""
echo "✦ Agregar clave SSH al agente SSH"

echo ""
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

echo ""