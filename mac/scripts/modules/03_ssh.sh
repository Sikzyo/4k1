#!/usr/bin/env zsh

GIT_EMAIL=$(git config --global user.email)

echo "✦ Modulo SSH ✦"
set -e

echo ""
echo "=> Validando si ya tienes creada una clave SSH"

if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
    echo ""
    echo "✦ Vamos a generar una nueva clave SSH"

    if [ -z "$GIT_EMAIL" ]; then
        echo ""
        read "new_email?=> Ingresa un correo para generar la clave: "

        GIT_EMAIL=$new_email
    fi

    echo ""
    echo "=> Generando nueva clave"

    ssh-keygen -t ed25519 -C "$GIT_EMAIL"

    echo ""
    echo "=> Iniciando agente SSH"

    eval "$(ssh-agent -s)"

    echo ""
    echo "=> Generando configuración para GitHub"

    if [ ! -f "$HOME/.ssh/config" ]; then
        mkdir -p "$HOME/.ssh"
        touch "$HOME/.ssh/config"
    fi

    if ! grep -q "Host github.com" "$HOME/.ssh/config"; then
        echo "" >> "$HOME/.ssh/config"
        echo "Host github.com" >> "$HOME/.ssh/config"
        echo "  User git" >> "$HOME/.ssh/config"
        echo "  AddKeysToAgent yes" >> "$HOME/.ssh/config"
        echo "  UseKeychain yes" >> "$HOME/.ssh/config"
        echo "  IdentityFile ~/.ssh/id_ed25519" >> "$HOME/.ssh/config"
    fi

    echo ""
    echo "=> Agregando clave SSH al ssh-agent"

    ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519"

    echo ""
    echo "✦ Vamos a agregar la clave ssh a GitHub"

    echo ""
    echo "=> Copiando clave publica..."

    pbcopy < "$HOME/.ssh/id_ed25519.pub"

    echo ""
    echo "=> Llave copiada exitosamente"

    echo ""
    echo "✦ Agrega la clave que se acaba de copiar en GitHub"
    echo "✦ Haz clic en New SSH key o Add SSH key."
    echo "✦ En el campo Title, agrega un nombre descriptivo."
    echo "✦ En el campo Key, pega tu clave pública (ya esta copiada en el portapapeles)."

    while true; do
        echo ""
        read "open_web?¿Deseas abrir la GitHub? [y/n]: " 

        case "$open_web" in
            [yY])
                echo ""
                echo "=> Abriendo GitHub..."

                open "https://github.com/settings/keys"
                break
            ;;
            [nN])
                echo ""
                echo "✦ Recuerda que es super importante agregar la clave para poder continuar"
                break
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
            ;;
        esac
    done

    echo ""
    read "?✦ Una vez que hayas agregado la clave regresa y presiona cualquier tecla para continuar"
fi

echo ""
echo "✦ Validando conexión con GitHub"

echo ""
ssh -T git@github.com || true

echo ""
echo "✦ Creación de clave SSH y conexión a GitHub se realizo correctamente."