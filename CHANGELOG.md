# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-06-18

### Added

- Integración del icono del proyecto en la cabecera del archivo `README.md` (según las indicaciones de la skill `create-readme`).
- Soporte para modo claro/oscuro en el logo del `README.md` usando la etiqueta `<picture>` y dos variantes del logo (`Icon-white.svg` e `Icon-black.svg`).

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
