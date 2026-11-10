#!/usr/bin/env bash
# Copia los recursos comunes de AIdeaText a la carpeta pública de un sitio.
#   scripts/instalar.sh <carpeta-publica>        p. ej. web/public
# Deja: favicon.svg/.ico, apple-touch-icon.png, icon-*.png en la raíz;
#       img/logo-aideatext.png, img/nvidia-inception-color.svg;
#       fonts/*.woff2; css/aideatext.css (con las rutas de fuentes a /fonts/).
set -euo pipefail
DEST=${1:?carpeta publica}
AQUI=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$DEST/img" "$DEST/fonts" "$DEST/css"
cp "$AQUI"/iconos/{favicon.svg,favicon.ico,apple-touch-icon.png,icon-192.png,icon-512.png,icon-maskable-512.png} "$DEST/"
cp "$AQUI"/logos/{logo-aideatext.png,nvidia-inception-color.svg} "$DEST/img/"
cp "$AQUI"/fuentes/* "$DEST/fonts/"
sed 's#\.\./fuentes/#/fonts/#g' "$AQUI/css/aideatext.css" > "$DEST/css/aideatext.css"
echo "Recursos AIdeaText copiados a $DEST"
