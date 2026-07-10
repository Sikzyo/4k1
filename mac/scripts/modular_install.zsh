#! /usr/bin/env zsh

MODULES_DIR="${0:A:h}/modules"
MODULES_FILES=("$MODULES_DIR"/*.zsh(N))

set -E
set -e

alert_error() {
	echo ""
	echo "=> La ejecución se detuvo porque un modulo o comando fallo"
	echo "=> Saliendo de la instalación"
}

show_menu() {
	echo "------------------"
	echo "✦ Módulos disponibles ✦"
	echo "------------------"
	for module in {1..$#MODULES_FILES}; do
		filename=$(basename $MODULES_FILES[$module])
		display_name="${filename#*_}"
		display_name="${display_name%.*}"
		echo "$module) $display_name"
	done
	echo "------------------"
	echo "0) Para regresar al menu principal"
	echo "------------------"
}

trap alert_error ERR

while true; do
	clear
	show_menu
	echo ""
	read "select_module?✦ Selecciona una opción: "

	echo ""
	if [[ "$select_module" =~ ^[0-9]+$ ]] && [[ "$select_module" -eq 0 ]]; then
		echo "=> Regresando al menu principal"
		break
	elif [[ "$select_module" =~ ^[0-9]+$ ]] && [[ "$select_module" -ge 1 && "$select_module" -le $#MODULES_FILES ]]; then
		chose_script="$MODULES_FILES[$select_module]"
		echo "=> Cargando modulo seleccionado"
		echo ""
		zsh "$chose_script"
		echo ""
	else
		echo "=> Opción no valida, por favor intenta nuevamente"
		echo ""
	fi
done
