git_email=$(git config --global user.email)

echo "✦ Configurar claves SSH para GitHub."

if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
    echo ""
    echo "✦ Generando nueva clave SSH."

    if [ -z "$git_email" ]; then
        read -p "✦ Por favor, ingresa un correo electrónico para continuar: " git_email
    fi

    echo ""
    ssh-keygen -t ed25519 -C "$git_email" 

    echo ""
    echo "✦ Iniciando agente SSH."

    eval "$(ssh-agent -s)"

    if [ ! -f "$HOME/.ssh/config" ]; then
        mkdir -p "$HOME/.ssh"
        touch "$HOME/.ssh/config"
    fi

    echo ""
    echo "✦ Configurando clave SSH para GitHub."

    if ! grep -q "Host github.com" "$HOME/.ssh/config"; then
        echo "" >> "$HOME/.ssh/config"
        echo "Host github.com" >> "$HOME/.ssh/config"
        echo "  User git" >> "$HOME/.ssh/config"
        echo "  AddKeysToAgent yes" >> "$HOME/.ssh/config"
        echo "  UseKeychain yes" >> "$HOME/.ssh/config"
        echo "  IdentityFile $HOME/.ssh/id_ed25519" >> "$HOME/.ssh/config"
    fi

    echo ""
    echo "✦ Agregar clave SSH al agente."

    ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519"

    echo ""
    echo "✦ Copiando llave publica al portapapeles."

    pbcopy < "$HOME/.ssh/id_ed25519.pub"

    echo ""
    echo "✦ Agregar clave en GitHub."

    echo ""
    echo "✦ Inicia sesión en GitHub."
    echo "✦ En la esquina superior derecha, haz clic en tu foto de perfil."
    echo "✦ Ve a Settings."
    echo "✦ En la barra lateral, entra en SSH and GPG keys (sección 'Access')."
    echo "✦ Haz clic en New SSH key o Add SSH key."

    echo ""
    echo "✦ Configurar la nueva clave."

    echo ""
    echo "✦ En el campo Title, agrega un nombre descriptivo."
    echo "✦ En el campo Key, pega tu clave pública (ya esta copiada en el portapapeles)."
    
    echo ""
    read -p "✦ ¿Deseas abrir la pagina de GitHub? [y/n]" open_github

    case "$open_github" in
    [yY])
        open "https://github.com/"
        ;;
    *)
    ;;
    esac

    echo ""
    read -p "✦ Una vez agregada la clave regresa y presiona cualquier botón para continuar."
fi

echo ""
echo "✦ Probando conexión con GitHub."

ssh -T git@github.com

echo ""
echo "✦ Creación de clave SSH y conexión a GitHub se realizo correctamente."