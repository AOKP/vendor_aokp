$(call inherit-product, device/samsung/klte/full_klte.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := aokp_klte
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := klte
PRODUCT_MANUFACTURER := samsung

PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
