#!/bin/bash
# Usage: ddc-switch-inputs 1

case "$1" in
   1 )
      # Config 1: Changer à l'entrée DisplayPort-1
      OUT="0x0f"
      ;;
   2 )
      # Config 2: Changer à l'entrée HDMI-2 (vous pouvez ajuster cela selon vos besoins)
      OUT="0x12"
      ;;
   * )
      echo "Configuration inconnue '$1'"
      exit 1
      ;;
esac

# Remplacez le numéro de bus (3) par le numéro approprié pour votre configuration.
ddcutil --bus=3 setvcp 60 "$OUT" &
wait

