#!/usr/bin/env bash

# ============================================================================
# Instalador Automático del Tema Pixel Art para Warp Terminal
# ============================================================================

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🎨 Instalador del Tema Pixel Art para Warp${NC}\n"

# Check if Warp is installed
if ! command -v warp-terminal &> /dev/null && ! [ -d "/Applications/Warp.app" ] && ! [ -d "$HOME/.local/share/warp-terminal" ]; then
    echo -e "${RED}❌ Warp no está instalado${NC}"
    echo "Instala Warp desde: https://www.warp.dev/"
    exit 1
fi

echo -e "${GREEN}✓${NC} Warp detectado"

# Create Warp themes directory
# Linux: ~/.local/share/warp-terminal/themes/
# macOS: ~/Library/Application Support/warp-terminal/themes/ (standard) but ~/.warp/themes also works sometimes
# We'll use the XDG standard for Linux

if [[ "$OSTYPE" == "darwin"* ]]; then
    WARP_THEMES_DIR="$HOME/Library/Application Support/warp-terminal/themes"
else
    # Linux
    WARP_THEMES_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/warp-terminal/themes"
fi

echo -e "\n${YELLOW}📁 Creando directorio de temas...${NC}"
mkdir -p "$WARP_THEMES_DIR"
echo -e "${GREEN}✓${NC} Directorio creado: $WARP_THEMES_DIR"

# Source and destination paths
SOURCE_THEME="$HOME/.dotfiles/terminal/warp/pixel-art.yaml"
DEST_THEME="$WARP_THEMES_DIR/pixel_art_retro.yaml"

# Check if source theme exists
if [ ! -f "$SOURCE_THEME" ]; then
    echo -e "${RED}❌ Tema no encontrado en: $SOURCE_THEME${NC}"
    exit 1
fi

# Create symlink
echo -e "\n${YELLOW}🔗 Creando symlink...${NC}"
if [ -L "$DEST_THEME" ] || [ -f "$DEST_THEME" ]; then
    echo -e "${YELLOW}⚠${NC}  El tema ya existe, reemplazando..."
    rm -f "$DEST_THEME"
fi

ln -sf "$SOURCE_THEME" "$DEST_THEME"
echo -e "${GREEN}✓${NC} Symlink creado: $DEST_THEME -> $SOURCE_THEME"

# Verify installation
if [ -L "$DEST_THEME" ]; then
    echo -e "\n${GREEN}✅ ¡Instalación completada!${NC}\n"
    echo -e "Para activar el tema:"
    echo -e "  1. Abre ${YELLOW}Warp${NC}"
    echo -e "  2. Ve a ${YELLOW}Settings${NC} (⌘ + ,)"
    echo -e "  3. ${YELLOW}Appearance${NC} → ${YELLOW}Themes${NC}"
    echo -e "  4. Busca y selecciona ${GREEN}\"Pixel Art Retro\"${NC}"
    echo -e "\n${YELLOW}💡 Tip:${NC} Puede que necesites reiniciar Warp para ver el tema"
else
    echo -e "${RED}❌ Error al crear el symlink${NC}"
    exit 1
fi

# Optional: Try to restart Warp (only works on macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "\n${YELLOW}¿Quieres reiniciar Warp ahora? (y/n)${NC}"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}🔄 Reiniciando Warp...${NC}"
        killall Warp 2>/dev/null || true
        sleep 1
        open -a Warp
        echo -e "${GREEN}✓${NC} Warp reiniciado"
    fi
fi

echo -e "\n${GREEN}🎮 ¡Disfruta tu terminal pixel art!${NC}"
