#!/bin/bash

# Obtener la capacidad de la batería
capacity=$(cat /sys/class/power_supply/BAT0/capacity)

# Obtener el estado de la batería (cargando, descargando, lleno, desconocido, etc.)
status=$(cat /sys/class/power_supply/BAT0/status)

# Definir colores para diferentes estados de la batería
charging_color="%{F#00FF00}"  #  cuando está cargando (verde)
discharging_color="%{F#FFFFFF}"  # cuando está descargando
full_color="%{F#7dcfff}"  # cuando está completamente cargada
# Seleccionar el color apropiado según el estado de la batería
if [ "$status" = "Charging" ]; then
      color=$charging_color
elif [ "$status" = "Discharging" ]; then
    color=$discharging_color
else
    color=$full_color
fi

# Definir íconos de Font Awesome para diferentes estados de la batería
charging_icon=""
discharging_icon=""
full_icon=""  # Puedes cambiar esto por el ícono de batería llena de Font Awesome

# Seleccionar el ícono apropiado según el estado de la batería
if [ "$status" = "Charging" ]; then
    icon=$charging_icon
elif [ "$status" = "Discharging" ]; then
    icon=$discharging_icon
else
    icon=$full_icon
fi

# Mostrar el estado de la batería en Polybar con el ícono y color de Font Awesome
echo "$color$icon $capacity%%{F-}"

