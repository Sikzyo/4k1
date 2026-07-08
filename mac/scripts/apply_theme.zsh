#!/usr/bin/env zsh

# THEMES_DIR="$HOME/.4k1/mac/themes"
# SCRIPTS_DIR="$HOME/.4k1/mac/scripts/theme_appliers"
THEMES_DIR="$HOME/Develop/4k1/mac/themes"
SCRIPTS_DIR="$HOME/Develop/4k1/mac/scripts/theme_appliers"
ALL_THEMES=("$THEMES_DIR"/*(N))


setopt errexit

alert_error() {
    echo ""
    echo "=> La ejecución se detuvo porque un modulo o comando fallo"
    echo "=> Saliendo de la instalación"
}

trap alert_error ZERR

menu_themes() {
    echo "------------------"
	echo "✦ Temas de color disponibles ✦"
	echo "------------------"
    for theme in {1..$#ALL_THEMES}; do
        filename=$(basename $ALL_THEMES[$theme])
        echo "$theme) $filename"
    done
    echo "------------------"
	echo "0) Para regresar al menu principal"
	echo "------------------"    
}

menu_flavors() {
    echo "------------------"
	echo "✦ variantes de color disponibles ✦"
	echo "------------------"
    for flavor in {1..$#ALL_FLAVORS}; do
        filename=$(basename $ALL_FLAVORS[$flavor])
        echo "$flavor) $filename"
    done
    echo "------------------"
	echo "0) Para regresar al menu principal"
	echo "------------------"    
}

select_theme() {
    local theme_applied=false
    while true; do
        clear
        menu_themes
        echo ""
        read "select_color_theme?✦ Selecciona un tema de color: "

        echo ""
        if [[ "$select_color_theme" =~ ^[0-9]+$ ]] && [[ "$select_color_theme" -eq 0 ]]; then
            echo "=> Regresando al menu principal"
            break
        elif [[ "$select_color_theme" =~ ^[0-9]+$ ]] && [[ "$select_color_theme" -ge 1 && "$select_color_theme" -le $#ALL_THEMES ]]; then
            chose_theme="$ALL_THEMES[$select_color_theme]"
            ALL_FLAVORS=("$chose_theme"/*(N))
            select_flavor
            if [[ $theme_applied = true ]]; then
                break
            fi
        else
            echo "=> Opción no valida, por favor intenta nuevamente"
        fi
    done
}

select_flavor() {
    while true; do
        clear
        menu_flavors
        echo ""
        read "select_flavor_theme?✦ Selecciona una variante de color: "

        echo ""
        if [[ "$select_flavor_theme" =~ ^[0-9]+$ ]] && [[ "$select_flavor_theme" -eq 0 ]]; then
            echo "=> Regresando al menu anterior"
            echo ""
            break
        elif [[ "$select_flavor_theme" =~ ^[0-9]+$ ]] && [[ "$select_flavor_theme" -ge 1 && "$select_flavor_theme" -le $#ALL_FLAVORS ]]; then
            chose_flavor="$ALL_FLAVORS[$select_flavor_theme]"
            theme_name=$(basename "$(dirname "$chose_flavor")")
            flavor_name=$(basename "$chose_flavor")
            
            echo "=> Aplicando tema: $theme_name ($flavor_name)"
            echo ""

            for app_dir in "$chose_flavor"/*(N); do
                local app_name=$(basename "$app_dir")
                local applier_script="$SCRIPTS_DIR/${app_name}.zsh"

                if [[ -f "$applier_script" ]]; then
                    echo "=> Configurando $app_name"
                    echo ""
                    zsh "$applier_script" "$app_dir"
                fi
            done
            theme_applied=true
            break
        else
            echo "=> Opción no valida, por favor intenta nuevamente"
        fi
    done 
}

select_theme