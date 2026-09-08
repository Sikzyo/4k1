package input

import (
	"bufio"
	"fmt"
	"os"
)

func GetInput() (string, error) {
	scanner := bufio.NewScanner(os.Stdin)
	fmt.Println("-> Ingresa una respuesta:")
	fmt.Print("✦ ")
	scanner.Scan()

	text := scanner.Text()

	return text, nil
}
