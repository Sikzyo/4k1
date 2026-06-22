GIT_USERNAME=$(git config --global user.name)
GIT_EMAIL=$(git config --global user.email)

echo "✦ Modulo de Git ✦"
set -e

sleep 1

echo ""
echo "=> Validando Git"

sleep 1

if brew list git &> /dev/null; then
    echo ""
    echo "✦ Ya tienes Git instalado mediante Homebrew"
else
    echo ""
    echo "✦ Se va a instalar Git mediante Homebrew"

    sleep 1

    echo ""
    brew install git

    sleep 1

    echo ""
    echo "✦ Git instalado correctamente"
fi

sleep 1

echo ""
echo "✦ Se va a realizar la configuración de Git"

sleep 1

echo ""
echo "=> Validando nombre de usuario..."

sleep 1

if [ -n "$GIT_USERNAME" ]; then
    echo ""
    echo "✦ Actualmente tu nombre de git es: $GIT_USERNAME"

    sleep 1

    while true; do
        echo ""
        read -p "✦ ¿Deseas actualizar tu nombre?: [y/n]" update_username

        sleep 1

        case "$update_username" in
            [yY])
                echo ""
                read -p "✦ Ingresa tu nuevo nombre de usuario: " new_username
    
                sleep 1
    
                echo ""
                echo "=> Actualizando nombre de usuario..."
    
                git config --global user.name "$new_username"
    
                sleep 1
    
                echo ""
                echo "✦ Nombre actualizado correctamente"
                break
            ;;
            [nN])
                echo ""
                echo "✦ Se conserva el nombre que ya existe"
                break
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
                echo ""
            ;;
       esac
    done
else
    echo ""
    read -p "✦ Por favor ingresa el nombre de usuario que vas a registrar en git: " new_username

    sleep 1

    echo ""
    echo "=> Registrando nombre de usuario..."

    git config --global user.name "$new_username"

    sleep 1

    echo ""
    echo "✦ Nombre de usuario configurado correctamente"
fi

sleep 1

echo ""
echo "=> Validando correo..."

sleep 1

if [ -n "$GIT_EMAIL" ]; then
    echo ""
    echo "✦ Actualmente tu correo es: $GIT_EMAIL"

    sleep 1

    while true; do
        echo ""
        read -p "✦ ¿Deseas actualizar tu correo?: [y/n]" update_email

        sleep 1

        case "$update_email" in
            [yY])
                echo ""
                read -p "✦ Ingresa tu nuevo correo: " new_email
    
                sleep 1
    
                echo ""
                echo "=> Actualizando correo..."
    
                git config --global user.email "$new_email"
    
                sleep 1
    
                echo ""
                echo "✦ Correo actualizado correctamente"
                break
            ;;
            [nN])
                echo ""
                echo "✦ Se conserva el correo que ya existe"
                break
            ;;
            *)
                echo ""
                echo "=> Opción no valida, por favor presiona 'y' o 'n'"
                echo ""
            ;;
       esac
    done
else
    echo ""
    read -p "✦ Por favor ingresa el correo que vas a registrar en git: " new_email

    sleep 1

    echo ""
    echo "=> Registrando correo..."

    git config --global user.email "$new_email"

    sleep 1

    echo ""
    echo "✦ Correo configurado correctamente"
fi

sleep 1

echo ""
echo "=> Validando nombre de rama..."

sleep 1

echo ""
echo "=> Configurando nombre de rama por defecto"

git config --global init.defaultBranch main

sleep 1

echo ""
echo "✦ Tu configuración de Git quedo de la siguiente manera"

sleep 1

echo ""
echo "=> Nombre de usuario: $(git config --global user.name)"
echo "=> Correo: $(git config --global user.email)"
echo "=> Nombre de rama por defecto:$(git config --global init.defaultBranch)"

sleep 3

echo ""
echo "✦ Git instalado y configurado correctamente"