$(call inherit-product, device/samsung/hlte/full_hlte.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_DEVICE := hlte
PRODUCT_NAME := aokp_hlte

PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
