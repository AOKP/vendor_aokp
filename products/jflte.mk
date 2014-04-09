$(call inherit-product, device/samsung/jflte/full_jflte.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_DEVICE := jflte
PRODUCT_NAME := aokp_jflte

PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
