package steps

import (
	"fmt"

	"github.com/sikzyo/4k1/internal/execute"
	"github.com/sikzyo/4k1/internal/input"
)

var User_git string
var Email_git string

func Git() error {
	fmt.Println("✦ Git ✦")

	err := installGit()
	if err != nil {
		return err
	}

	config, err := gitMenu()
	if err != nil {
		return err
	}

	if !config {
		return nil
	}

	return gitConfig()
}

func installGit() error {
	fmt.Println("-> Validando instalación de git")

	err := execute.Command("brew", "list", "git")

	if err == nil {
		fmt.Println("-> Git ya se encuentra instalado")
		return nil
	}

	fmt.Println("-> Instalando Git mediante Homebrew")
	err = execute.CommandNull("brew", "install", "git")

	if err != nil {
		fmt.Println("-> El comando de instalación de Git fallo")
		return err
	}

	fmt.Println("-> Git instalado correctamente")

	return nil
}

func gitMenu() (bool, error) {
	for {
		fmt.Println("-> ¿Deseas configurar git? [y/n]")
		response, err := input.GetInput()

		if err != nil {
			fmt.Println(err)
			return false, err
		}

		switch response {
		case "y", "Y":
			return true, nil
		case "n", "N":
			return false, nil
		default:
			fmt.Println("-> Opción no valida, por favor inténtalo nuevamente")
		}
	}
}

func gitConfig() error {
	fmt.Println("✦ Configuración de Git ✦")

	fmt.Println("-> Ingresa tu nombre de usuario para Git")
	User_git, err := input.GetInput()
	if err != nil {
		fmt.Println("-> Error al registrar el nombre")
		return err
	}

	fmt.Println("-> Ingresa tu correo para Git")
	Email_git, err := input.GetInput()
	if err != nil {
		fmt.Println("-> Error al registrar el correo")
		return err
	}

	fmt.Println("-> Aplicando configuraciones de Git")
	err = execute.Command("git", "config", "--global", "user.name", User_git)
	if err != nil {
		return err
	}

	err = execute.Command("git", "config", "--global", "user.email", Email_git)
	if err != nil {
		return err
	}

	err = execute.Command("git", "config", "--global", "init.defaultBranch", "main")
	if err != nil {
		return err
	}

	fmt.Println("✦ Git se configuro correctamente")
	return nil
}
