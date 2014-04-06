$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

#Unified device flag for Verizon permissions
VZW_UNIFIED := true

# Inherit common Verizon Wireless perms & lib
$(call inherit-product, vendor/aokp/configs/vzw.mk)

PRODUCT_DEVICE := jflte
PRODUCT_NAME := aokp_jflte

PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
