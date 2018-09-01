#!/bin/bash
## Usage
## app_icon_set_sips.sh Icon.png

mkdir -p icons 2>/dev/null
sips -z 20 20 --out icons/Icon-20@.png $1
sips -z 40 40 --out icons/Icon-20@2x.png $1
sips -z 60 60 --out icons/Icon-20@3x.png $1
sips -z 29 29 --out icons/Icon-29@.png $1
sips -z 58 58 --out icons/Icon-29@2x.png $1
sips -z 87 87 --out icons/Icon-29@3x.png $1
sips -z 40 40 --out icons/Icon-40@.png $1
sips -z 80 80 --out icons/Icon-40@2x.png $1
sips -z 120 120 --out icons/Icon-40@3x.png $1
sips -z 120 120 --out icons/Icon-60@2x.png $1
sips -z 180 180 --out icons/Icon-60@3x.png $1
sips -z 76 76 --out icons/Icon-76@.png $1
sips -z 152 152 --out icons/Icon-76@2x.png $1
sips -z 167 167 --out icons/Icon-83.5@2x.png $1
