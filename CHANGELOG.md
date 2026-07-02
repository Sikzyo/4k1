# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.1] - 2026-07-02

### Changed

- Actualización de [README.md](file:///Users/jane/Develop/4k1/README.md) para documentar la nueva estructura de módulos del instalador y el script coordinador principal `install.sh`.

## [1.0.0] - 2026-07-02

### Added

- Nuevo script `mac/scripts/full_install.sh` para la instalación completa y secuencial de todos los módulos.
- Nuevo módulo para instalación de fuentes de texto (`mac/scripts/modules/04_fonts.zsh`).
- Nuevo módulo para configuración del entorno JS/Node.js/Bun/pnpm (`mac/scripts/modules/06_js.zsh`).
- Nuevo módulo para configuración del entorno Go (`mac/scripts/modules/07_go.zsh`).
- Nuevo módulo para configuración del entorno Flutter (`mac/scripts/modules/08_flutter.zsh`).
- Nuevo módulo para configuración de Docker (`mac/scripts/modules/09_docker.zsh`).
- Nuevo módulo para instalación de utilidades CLI/Terminal (`mac/scripts/modules/10_terminal_apps.zsh`).
- Nuevo módulo para instalación de aplicaciones GUI (`mac/scripts/modules/11_gui_apps.zsh`).
- Nuevos alias de terminal agregados en `mac/config/zsh/aliases.zsh`.

### Changed

- Restructuración del sistema de instalación de macOS, moviendo los submódulos de instalación al subdirectorio `mac/scripts/modules/`.
- Migración y reescritura de scripts de Bash (`.sh`) a scripts de Zsh (`.zsh`) para la configuración de entornos específicos.
- Refinamiento y mejoras en la lógica de scripts principales como el instalador de Homebrew (`01_homebrew.sh`), configuración de Git (`02_git.sh`) y aprovisionamiento de llaves SSH (`03_ssh.zsh`).

### Fixed

- Asegurada la creación automática de `~/.zprofile` en el módulo de Zsh.
- Corrección en la verificación interactiva de Xcode Command Line Tools y resolución de rutas dinámicas del instalador.
- Ajuste de retrasos de interacción en el instalador de macOS para mejorar la experiencia de usuario.

## [0.2.0] - 2026-06-19

### Added

- Integración del icono del proyecto en la cabecera del archivo `README.md`.
- Soporte para modo claro/oscuro en el logo del `README.md` usando la etiqueta `<picture>`.

### Changed

- Reemplazo de enlaces simbólicos por copias físicas de archivos de configuración para editores de código (Cursor y Zed) y perfiles de terminal.
- Reorganización de la configuración dinámica de Zsh para cargarse desde la ruta local permanente `$HOME/.config/zsh` en lugar del repositorio temporal `.dotfile`.
- Actualización de `install_mac.sh` para limpiar y eliminar el directorio temporal `.dotfile` al finalizar la instalación de forma segura.
- Aumento de la altura del logo en el `README.md` a 64px para mejorar la visibilidad.
- Modificación del instalador de agentes de IA para copiar físicamente las skills en lugar de usar enlaces simbólicos.

## [0.1.0] - 2026-06-18

### Added

- Sistema modular interactivo de instalación secuencial para configurar entornos de desarrollo completos en macOS.
- Script principal de instalación `install_mac.sh` y el coordinador secuencial `mac/install.sh`.
- Scripts modulares numerados para el aprovisionamiento de herramientas (Homebrew, Git, llaves SSH, fuente Monaspace, perfiles Zsh, entornos JS/Node.js/Bun/pnpm, Go, Flutter SDK, Docker Desktop, editores de código como Cursor/Zed/VS Code y utilidades CLI).
- Script interactivo de instalación para aplicaciones GUI cotidianas (`13_gui_apps.sh`).
- Integración de agentes de IA mediante scripts y enlaces locales de skills (`12_ai_agents.sh` y carpeta `mac/skills`).

### Changed

- Reorganización de la instalación de skills locales para agentes de IA con validaciones de carpetas.
- Reescritura del README.md en un estilo minimalista enfocado en la estructura de módulos y guías de instalación rápida.
