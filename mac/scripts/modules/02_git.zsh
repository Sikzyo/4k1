#!/usr/bin/env zsh

GIT_USERNAME=$(git config --global user.name)
GIT_EMAIL=$(git config --global user.email)

echo "✦ Modulo Git ✦"
setopt errexit

echo ""
echo "=> Validando Git"

if brew list git &> /dev/null; then
    echo ""
    echo "✦ Ya tienes Git instalado mediante Homebrew"
else
    echo ""
    echo "✦ Se va a instalar Git mediante Homebrew"

    echo ""
    brew install git

    echo ""
    echo "✦ Git instalado correctamente"
fi

echo ""
echo "✦ Se va a realizar la configuración de Git"

echo ""
echo "=> Validando nombre de usuario..."

if [ -n "$GIT_USERNAME" ]; then
    echo ""
    echo "✦ Actualmente tu nombre de git es: $GIT_USERNAME"

    while true; do
        echo ""
        read "update_username?✦ ¿Deseas actualizar tu nombre? [y/n]: " 

        case "$update_username" in
            [yY])
                echo ""
                read "new_username?✦ Ingresa tu nuevo nombre de usuario: " 
    
                echo ""
                echo "=> Actualizando nombre de usuario..."
    
                git config --global user.name "$new_username"
    
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
            ;;
       esac
    done
else
    echo ""
    read "new_username?✦ Por favor ingresa el nombre de usuario que vas a registrar en git: " 

    echo ""
    echo "=> Registrando nombre de usuario..."

    git config --global user.name "$new_username"

    echo ""
    echo "✦ Nombre de usuario configurado correctamente"
fi

echo ""
echo "=> Validando correo..."

if [ -n "$GIT_EMAIL" ]; then
    echo ""
    echo "✦ Actualmente tu correo es: $GIT_EMAIL"

    while true; do
        echo ""
        read "update_email?✦ ¿Deseas actualizar tu correo? [y/n]: " 

        case "$update_email" in
            [yY])
                echo ""
                read "new_email?✦ Ingresa tu nuevo correo: " 
    
                echo ""
                echo "=> Actualizando correo..."
    
                git config --global user.email "$new_email"
    
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
            ;;
       esac
    done
else
    echo ""
    read "new_email?✦ Por favor ingresa el correo que vas a registrar en git: " 

    echo ""
    echo "=> Registrando correo..."

    git config --global user.email "$new_email"

    echo ""
    echo "✦ Correo configurado correctamente"
fi

echo ""
echo "=> Validando nombre de rama..."

echo ""
echo "=> Configurando nombre de rama por defecto"

git config --global init.defaultBranch main

echo ""
echo "✦ Tu configuración de Git quedo de la siguiente manera"

echo ""
echo "=> Nombre de usuario: $(git config --global user.name)"
echo "=> Correo: $(git config --global user.email)"
echo "=> Nombre de rama por defecto:$(git config --global init.defaultBranch)"

echo ""
echo "✦ Git instalado y configurado correctamente"