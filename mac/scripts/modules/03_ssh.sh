GIT_EMAIL=$(git config --global user.email)

echo "✦ Modulo SSH ✦"
set -e

echo ""
echo "=> Validando si ya tienes creada una clave SSH"

sleep 0.5

if [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
    echo ""
    echo "✦ Vamos a generar una nueva clave SSH"

    sleep 0.5

    if [ -z "$GIT_EMAIL" ]; then
        echo ""
        read -p "=> Ingresa un correo para generar la clave" new_email

        sleep 0.3

        GIT_EMAIL=$new_email
    fi

    echo ""
    echo "=> Generando nueva clave"

    ssh-keygen -t ed25519 -C "$GIT_EMAIL"

    sleep 0.5

    echo ""
    echo "=> Iniciando agente SSH"

    eval "$(ssh-agent -s)"

    sleep 0.5

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

    sleep 0.5

    echo ""
    echo "=> Agregando clave SSH al ssh-agent"

    ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519"

    sleep 0.5

    echo ""
    echo "✦ Vamos a agregar la clave ssh a GitHub"

    sleep 0.5

    echo ""
    echo "=> Copiando clave publica..."

    pbcopy < "$HOME/.ssh/id_ed25519.pub"

    sleep 0.5

    echo ""
    echo "=> Llave copiada exitosamente"

    echo ""
    echo "✦ Agrega la clave que se acaba de copiar en GitHub"
    echo "✦ Haz clic en New SSH key o Add SSH key."
    echo "✦ En el campo Title, agrega un nombre descriptivo."
    echo "✦ En el campo Key, pega tu clave pública (ya esta copiada en el portapapeles)."

    sleep 4

    while true; do
        echo ""
        read -p "¿Deseas abrir la GitHub? [y/n]: " open_web

        sleep 0.3

        case "$open_web" in
            [yY])
                echo ""
                echo "=> Abriendo GitHub..."

                sleep 0.5

                open "https://github.com/settings/keys"
                break
            ;;
            [nN])
                echo ""
                echo "✦ Recuerda que es super importante agregar la clave para poder continuar"

                sleep 1
                break
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
            ;;
        esac
    done

    echo ""
    read -p "✦ Una vez que hayas agregado la clave regresa y presiona cualquier tecla para continuar"

    sleep 0.5
fi

echo ""
echo "✦ Validando conexión con GitHub"

sleep 0.5

echo ""
ssh -T git@github.com || true

echo ""
echo "✦ Creación de clave SSH y conexión a GitHub se realizo correctamente."