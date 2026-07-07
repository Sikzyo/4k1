# 4k1 

<picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/Icon-white.svg">
    <source media="(prefers-color-scheme: light)" srcset="assets/Icon-black.svg">
    <img alt="4k1 Logo" src="assets/Icon-black.svg" height="64" align="center">
</picture>

4k1 automatiza de manera interactiva la instalación de herramientas esenciales, perfiles de editores, fuentes y agentes de IA.

---

## Instalación

Para iniciar la configuración en una instalación limpia:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Sikzyo/4k1/main/install.sh)"
```

> [!IMPORTANT]
> Revisa los scripts en [mac/scripts/modules/](file:///Users/jane/Develop/4k1/mac/scripts/modules) antes de ejecutar la instalación para entender los cambios aplicados en tu sistema.

---

## Estructura del Proyecto

- [install.sh](file:///Users/jane/Develop/4k1/install.sh) — Script principal de entrada con validación del sistema operativo.
- [install_linux.sh](file:///Users/jane/Develop/4k1/install_linux.sh) — Script principal de entrada para Linux (en desarrollo).
- [mac/](file:///Users/jane/Develop/4k1/mac) — Automatizaciones y configuraciones para macOS.
  - [install.sh](file:///Users/jane/Develop/4k1/mac/install.sh) — Coordinador interactivo del instalador.
  - [config/](file:///Users/jane/Develop/4k1/mac/config) — Ajustes y configuraciones de terminal y alias para Zsh.
  - [scripts/](file:///Users/jane/Develop/4k1/mac/scripts) — Scripts y herramientas de automatización.
    - [full_install.sh](file:///Users/jane/Develop/4k1/mac/scripts/full_install.sh) — Coordinador de la instalación completa de módulos.
    - [modules/](file:///Users/jane/Develop/4k1/mac/scripts/modules) — Módulos individuales de instalación secuencial.
  - [skills/](file:///Users/jane/Develop/4k1/mac/skills) — Skills locales para integración con agentes de IA.
- [linux/](file:///Users/jane/Develop/4k1/linux) — Soporte para Linux (en desarrollo).

---

## Módulos de Instalación

El instalador secuencial ejecuta los siguientes scripts en orden:

1.  [01_homebrew.sh](file:///Users/jane/Develop/4k1/mac/scripts/modules/01_homebrew.sh) — Instalación y configuración del gestor de paquetes Homebrew.
2.  [02_git.sh](file:///Users/jane/Develop/4k1/mac/scripts/modules/02_git.sh) — Ajustes de usuario Git y configuración de rama por defecto `main`.
3.  [03_ssh.sh](file:///Users/jane/Develop/4k1/mac/scripts/modules/03_ssh.sh) — Generación de llaves SSH `ed25519` y validación de conexión con GitHub.
4.  [04_fonts.sh](file:///Users/jane/Develop/4k1/mac/scripts/modules/04_fonts.sh) — Descarga e instalación de la fuente tipográfica Monaspace.
5.  [05_zsh.sh](file:///Users/jane/Develop/4k1/mac/scripts/modules/05_zsh.sh) — Enlace del archivo de configuración `~/.zshrc` y alias personalizados.
6.  [06_js.zsh](file:///Users/jane/Develop/4k1/mac/scripts/modules/06_js.zsh) — Configuración del entorno Node.js, pnpm y Bun.
7.  [07_go.zsh](file:///Users/jane/Develop/4k1/mac/scripts/modules/07_go.zsh) — Configuración e instalación de Go.
8.  [08_flutter.zsh](file:///Users/jane/Develop/4k1/mac/scripts/modules/08_flutter.zsh) — Instalación de Flutter SDK, CocoaPods y desactivación de telemetría.
9.  [09_docker.zsh](file:///Users/jane/Develop/4k1/mac/scripts/modules/09_docker.zsh) — Descarga e instalación de Docker Desktop.
10. [10_terminal_apps.zsh](file:///Users/jane/Develop/4k1/mac/scripts/modules/10_terminal_apps.zsh) — Instalación de utilidades CLI y terminales modernas (como Warp).
11. [11_gui_apps.zsh](file:///Users/jane/Develop/4k1/mac/scripts/modules/11_gui_apps.zsh) — Instalación interactiva de aplicaciones GUI cotidianas (Brave, Figma, Notion, Spotify, etc.).
