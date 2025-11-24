# 📜 Scripts

Colección de scripts de utilidad para automatizar tareas comunes.

## 🚀 Uso

Puedes ejecutar cualquier script directamente o usar el runner interactivo:

```bash
# Ejecutar runner interactivo (requiere fzf)
scripts
# o el alias
spellbook

# Ejecutar script específico
scripts/git/gl
```

## 📂 Contenido

### 🛠️ Utilidades Generales
- **`scripts`**: Runner interactivo. Explora y ejecuta scripts con una interfaz visual.
- **`hocus`**: Wrapper para ejecutar scripts por contexto (ej. `hocus git gl`).
- **`update-system`**: Actualiza sistema, plugins zsh, fnm, y repositorios.
- **`backup-dotfiles`**: Realiza commit y push de cambios en dotfiles.

### 🐙 Git (`scripts/git/`)
- **`gl`**: Git log mejorado.
- **`branch-d`**: Eliminar rama.
- **`branch-da`**: Eliminar todas las ramas excepto main/master.
- **`branch-dm`**: Eliminar ramas mergeadas.
- **`checkout`**: Checkout interactivo de ramas.
- **`discard`**: Descartar cambios en archivos.
- **`pair-files`**: Listar archivos modificados por autor.
- **`undo`**: Deshacer último commit.

### 🐳 Docker (`scripts/docker/`)
- **`connect`**: Conectarse a un contenedor en ejecución.
- **`prune`**: Limpiar contenedores, imágenes y volúmenes no usados.

### 📝 VS Code (`scripts/vscode/`)
- Scripts para gestión de extensiones y configuración.

## ⚙️ Requisitos

- `fzf`: Para menús interactivos.
- `bat`: Para previews con color.
- `lsd`: Para listados de directorios.
