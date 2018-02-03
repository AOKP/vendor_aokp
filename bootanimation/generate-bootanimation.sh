#!/bin/bash

WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"
OUT="$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION"

if [ -z "$WIDTH" ]; then
    echo "Warning: bootanimation width not specified"
    WIDTH="1080"
fi

if [ -z "$HEIGHT" ]; then
    echo "Warning: bootanimation height not specified"
    HEIGHT="1080"
fi

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    SIZE="$HEIGHT"
else
    SIZE="$WIDTH"
fi

if [ "$HALF_RES" != "false" ]; then
    IMAGESIZE=$(expr $SIZE / 1)
else
    IMAGESIZE="$SIZE"
fi

RESOLUTION=""$IMAGESIZE"x"$IMAGESIZE""

for part_cnt in 0
do
    mkdir -p $ANDROID_PRODUCT_OUT/obj/BOOTANIMATION/bootanimation/part$part_cnt
done
tar xfp "vendor/aokp/bootanimation/bootanimation.tar" -C "$OUT/bootanimation/"
mogrify -resize $RESOLUTION -colors 250 "$OUT/bootanimation/"*"/"*".png"

# Create desc.txt
echo "$SIZE $SIZE" 30 > "$OUT/bootanimation/desc.txt"
cat "vendor/aokp/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
