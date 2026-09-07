package steps

import (
	"fmt"
	"os"

	"github.com/sikzyo/4k1/internal/execute"
)

func InstallHomebrew() error {
	fmt.Println("✦ Homebrew ✦")

	fmt.Println("-> Validando Homebrew")
	err := execute.Command("command", "-v", "homebrew")

	if err != nil {
		fmt.Println("-> Homebrew ya se encuentra instalado")
		return nil
	}

	fmt.Println("-> Instalando Homebrew")

	err = execute.Command("/bin/bash", "-c", "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

	if err != nil {
		fmt.Println("-> Ocurrió un error al momento de instalar Homebrew")
		return err
	}

	fmt.Println("-> Creando archivo .zprofile")

	file, err := os.Create("$HOME/.zprofile")

	if err != nil {
		fmt.Println("Error al crear el archivo .zprofile")
		return err
	}

	defer file.Close()

	_, err = file.WriteString("eval '$(/opt/homebrew/bin/brew shellenv)'")

	if err != nil {
		fmt.Println("Error al momento de configurar .zprofile")
		return err
	}

	fmt.Println("-> Validando instalación de Homebrew")
	err = execute.Command("brew", "-v")

	if err != nil {
		fmt.Println("-> Se presento un error al momento de instalar Homebrew")
		return err
	}

	fmt.Println("✦ Homebrew se instalo correctamente")

	return nil
}
