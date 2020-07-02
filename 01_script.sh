#!/bin/bash

source $(pwd)/.env

mkdir -p "INPUT/"${mode}

#youtube-dl -F "${video}"
youtube-dl -f 22 "${video}" -o 'INPUT/'${mode}'/%(title)s.%(ext)s' 



