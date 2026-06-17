# 4k1

> Sistema de dotfiles modular para automatizar e instalar entornos de desarrollo completos de forma rápida y sencilla en macOS y Linux.

Este repositorio contiene mis archivos de configuración personal (dotfiles) y scripts de automatización para replicar mi entorno de desarrollo ideal de manera interactiva y predecible.

## Características principales

- **Configuración Interactiva y Modular**: El proceso se realiza a través de scripts independientes numerados (`01` al `13`), lo que permite decidir qué herramientas instalar en cada ejecución.
- **Entornos de Desarrollo Listos para Usar**:
  - **JavaScript/TypeScript**: Instalación automática de Node.js, `pnpm` y `bun`.
  - **Go**: Instalación de Go.
  - **Flutter**: Instalación de Flutter y configuración automática para desarrollo móvil (desactivación de analíticas de Google, instalación de CocoaPods y Android SDK).
- **Editores de Código Sincronizados**:
  - Ajustes preconfigurados y enlaces simbólicos automáticos para **Cursor** y **Zed**.
  - Opciones de instalación para **VS Code**, **Android Studio** y **micro**.
- **Terminal Personalizada**:
  - Configuración automática de `zsh` usando enlaces simbólicos a `mac/config/zsh/.zshrc`.
  - Soporte para alias comunes y variables de entorno modulares.
  - Instalación opcional de **Warp**, **open-code**, **codex**, **claude-code** y **antigravity-cli**.
- **Seguridad y Conectividad**:
  - Configuración inicial interactiva de Git (nombre, correo y rama por defecto).
  - Generación asistida de claves SSH (ED25519) y prueba de conexión directa con GitHub.
- **Fuentes de Programación**:
  - Instalación automática de la fuente **Monaspace** de GitHub.

## Estructura del Proyecto

El repositorio está organizado por plataformas, facilitando la separación de configuraciones específicas de sistema operativo:

- `install_mac.sh`: Script principal de entrada para macOS.
- `mac/`: Carpeta con automatizaciones y configuraciones para macOS.
  - `install.sh`: Coordinador principal del proceso de instalación.
  - `scripts/`: Colección de scripts individuales de instalación (Homebrew, Git, SSH, lenguajes, etc.).
  - `config/`: Archivos de configuración de editores (Cursor y Zed) y perfiles de terminal (`zsh`).
- `linux/`: Carpeta destinada a configuraciones en Linux (actualmente en desarrollo).

## Instalación y Configuración

> [!IMPORTANT]
> Se recomienda revisar los scripts dentro de `mac/scripts/` antes de ejecutar la instalación para entender qué configuraciones se aplicarán.

### macOS

Para iniciar la configuración en una instalación limpia de macOS, ejecuta el siguiente comando:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Sikzyo/4k1/main/install_mac.sh)"
```

El script verificará e instalará las **Xcode Command Line Tools** si no están presentes, clonará este repositorio en `~/.dotfile` e iniciará el instalador interactivo de forma secuencial.

### Linux

Actualmente, el soporte para Linux y la configuración automática de agentes está en desarrollo. Los archivos correspondientes en la carpeta `linux/` sirven como base para futuras integraciones.