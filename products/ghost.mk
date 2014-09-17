$(call inherit-product, device/motorola/ghost/full_ghost.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/ghost

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ghost
PRODUCT_NAME := aokp_ghost

