#!/bin/bash

PRODUCT_OUT="$1"
WIDTH="$2"
HEIGHT="$3"
HALF_RES="$4"

OUT="$PRODUCT_OUT/obj/BOOTANIMATION"

IMAGEWIDTH="$WIDTH"

IMAGESCALEWIDTH="$IMAGEWIDTH"
IMAGESCALEHEIGHT="$IMAGEWIDTH"

if [ "$HALF_RES" = "true" ]; then
    IMAGEWIDTH=$(expr $IMAGEWIDTH / 2)
fi

IMAGEHEIGHT="$IMAGEWIDTH"

RESOLUTION=""$IMAGEWIDTH"x"$IMAGEHEIGHT""

for part_cnt in 0
do
    mkdir -p "$OUT/bootanimation/part$part_cnt"
done
tar xfp "vendor/aokp/bootanimation/bootanimation.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".png"

# Create desc.txt
echo "$IMAGESCALEWIDTH $IMAGESCALEHEIGHT" 30 > "$OUT/bootanimation/desc.txt"
cat "vendor/aokp/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
