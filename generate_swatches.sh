#!/bin/bash
# Ignore Fontconfig warning: https://github.com/openscad/openscad/issues/2888

if [ "$#" -ne 1 ]; then
      echo "Path to filament name file required"
      exit 1
fi

while read filament; do
  make=$(echo $filament | awk -F ',' '{print $1}')
  model=$(echo $filament | awk -F ',' '{print $2}')
  if [[ -z "${make}" || -z "${model}" ]]; then
    echo "Format of filament file is <make>,<model>"
    exit 1
  fi
  openscad  -o "swatches/filament_swatch-${make}-${model}.stl" "filament_chip_scad-rounded.scad" -D "make=\"$make\"" -D "model=\"$model\"" 
done < $1
