package steps

import (
	"fmt"
	"time"

	"github.com/sikzyo/4k1/internal/execute"
)

func InstallXcode() error {
	fmt.Println("✦ Xcode ✦")

	fmt.Println("-> Validando versión de xcode")
	cmd := execute.Command("xcode-select", "-p")

	if cmd == nil {
		fmt.Println("-> Xcode instalado correctamente")
		return nil
	}

	fmt.Println("-> Instalando xcode")
	cmd = execute.Command("xcode-select", "--install")

	if cmd != nil {
		fmt.Println("-> Error al instalar Xcode")
		return cmd
	}

	fmt.Println("✦ Se abrió una ventana para la instalación de Xcode")
	fmt.Println("✦ Continua en esa ventana el proceso de instalación")
	fmt.Println("✦ Al terminar la instalación de Xcode, regresa para continuar con la configuración")

	for true {
		// Comando para validar si el proceso de instalación termino
		cmd = execute.CommandNull("pgrep", "-f", "Install Command Line Developer Tools")
		if cmd != nil {
			break
		}

		time.Sleep(5 * time.Second)
	}

	cmd = execute.Command("xcode-select", "-p")

	if cmd != nil {
		fmt.Println("-> Ocurrió un error al momento de instalar xcode")
		return cmd
	}

	fmt.Println("La instalación de Xcode se ejecuto de manera correcta")

	return nil
}
