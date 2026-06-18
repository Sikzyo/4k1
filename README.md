# 4k1 

<picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/Icon-white.svg">
    <source media="(prefers-color-scheme: light)" srcset="assets/Icon-black.svg">
    <img alt="4k1 Logo" src="assets/Icon-black.svg" height="24" align="center">
</picture>

4k1 automatiza de manera interactiva la instalación de herramientas esenciales, perfiles de editores, fuentes y agentes de IA.

---

## Instalación

Para iniciar la configuración en una instalación limpia de macOS:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Sikzyo/4k1/main/install_mac.sh)"
```

> [!IMPORTANT]
> Revisa los scripts en [mac/scripts/](file:///Users/jane/Develop/4k1/mac/scripts) antes de ejecutar la instalación para entender los cambios aplicados en tu sistema.

---

## Estructura del Proyecto

- [install_mac.sh](file:///Users/jane/Develop/4k1/install_mac.sh) — Script principal de entrada para macOS.
- [install_linux.sh](file:///Users/jane/Develop/4k1/install_linux.sh) — Script principal de entrada para Linux (en desarrollo).
- [mac/](file:///Users/jane/Develop/4k1/mac) — Automatizaciones y configuraciones para macOS.
  - [install.sh](file:///Users/jane/Develop/4k1/mac/install.sh) — Coordinador del instalador secuencial.
  - [config/](file:///Users/jane/Develop/4k1/mac/config) — Ajustes para Zsh, Cursor y Zed.
  - [scripts/](file:///Users/jane/Develop/4k1/mac/scripts) — Scripts modulares numerados.
  - [skills/](file:///Users/jane/Develop/4k1/mac/skills) — Skills locales para integración con agentes de IA.
- [linux/](file:///Users/jane/Develop/4k1/linux) — Soporte para Linux (en desarrollo).

---

## Módulos de Instalación

El instalador ejecuta los siguientes scripts en orden:

1.  [01_homebrew.sh](file:///Users/jane/Develop/4k1/mac/scripts/01_homebrew.sh) — Instalación y configuración de Homebrew.
2.  [02_git.sh](file:///Users/jane/Develop/4k1/mac/scripts/02_git.sh) — Ajustes de usuario Git y rama por defecto `main`.
3.  [03_ssh_key.sh](file:///Users/jane/Develop/4k1/mac/scripts/03_ssh_key.sh) — Generación de llaves SSH `ed25519` y prueba con GitHub.
4.  [04_fonts.sh](file:///Users/jane/Develop/4k1/mac/scripts/04_fonts.sh) — Instalación de la fuente Monaspace.
5.  [05_zsh.sh](file:///Users/jane/Develop/4k1/mac/scripts/05_zsh.sh) — Enlace simbólico de `~/.zshrc`.
6.  [06_js.sh](file:///Users/jane/Develop/4k1/mac/scripts/06_js.sh) — Instalación de Node.js, pnpm y Bun.
7.  [07_go.sh](file:///Users/jane/Develop/4k1/mac/scripts/07_go.sh) — Instalación de Go.
8.  [08_flutter.sh](file:///Users/jane/Develop/4k1/mac/scripts/08_flutter.sh) — Instalación de Flutter SDK, CocoaPods y telemetría desactivada.
9.  [09_docker.sh](file:///Users/jane/Develop/4k1/mac/scripts/09_docker.sh) — Instalación de Docker Desktop.
10. [10_code_editors.sh](file:///Users/jane/Develop/4k1/mac/scripts/10_code_editors.sh) — Instalación y configuraciones para Cursor, Zed, VS Code y Android Studio.
11. [11_terminal_apps.sh](file:///Users/jane/Develop/4k1/mac/scripts/11_terminal_apps.sh) — Instalación interactiva de terminales y utilidades CLI (Warp, open-code, claude-code, etc.).
12. [12_ai_agents.sh](file:///Users/jane/Develop/4k1/mac/scripts/12_ai_agents.sh) — Enlace de skills para Claude, Gemini y agentes locales.
13. [13_gui_apps.sh](file:///Users/jane/Develop/4k1/mac/scripts/13_gui_apps.sh) — Instalación interactiva de aplicaciones cotidianas (Brave, Figma, Notion, Spotify, etc.).
