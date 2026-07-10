#! /usr/bin/env zsh

MODULES_DIR="${0:A:h}/modules"
MODULES_FILES=("$MODULES_DIR"/*.zsh(N))

setopt errexit
trap alert_error ZERR

alert_error() {
	echo ""
	echo "=> La ejecución se detuvo porque un modulo o comando fallo"
	echo "=> Saliendo de la instalación"
}

clear

echo "✦ Iniciando proceso de instalación completa ✦"

for module in {1..$#MODULES_FILES}; do
	chose_script="$MODULES_FILES[$module]"
	filename=$(basename $chose_script)
	display_name="${filename#*_}"
	display_name="${display_name%.*}"

	echo ""
	echo "=> Cargando modulo $module) $display_name"
	zsh "$chose_script"

	if [[ "$display_name" == "homebrew" ]]; then
		source ~/.zprofile
	fi
done

echo ""
echo "✦ ¡Instalación completa finalizada con éxito! ✦"