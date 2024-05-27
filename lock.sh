#!/bin/bash
# Script para capturar y desenfocar el fondo de pantalla antes de bloquear

# Ruta de la imagen del indicador de desbloqueo
lock_indicator_image="/home/angell/Imágenes/.wallpaper/.lock_circle.png"

# Captura una imagen del escritorio usando scrot
scrot ~/Imágenes/escritorio.png

# Aplica un efecto de desenfoque a la imagen capturada
convert ~/Imágenes/escritorio.png -blur 0x8 ~/Imágenes/escritorio_blur.png

# Sobreponer el indicador de desbloqueo a la imagen desenfocada
convert ~/Imágenes/escritorio_blur.png \( "$lock_indicator_image" -resize 200x200 \) -gravity center -composite ~/Imágenes/escritorio_with_lock_indicator.png

# Ejecuta i3lock con la imagen que incluye el indicador de desbloqueo
i3lock -i ~/Imágenes/escritorio_with_lock_indicator.png

# Suspender sistema
systemctl suspend

# Remover imágenes temporales
rm ~/Imágenes/escritorio.png  
rm ~/Imágenes/escritorio_blur.png
rm ~/Imágenes/escritorio_with_lock_indicator.png

