# Inherit AOSP device configuration for nicki
$(call inherit-product-if-exists, device/sony/nicki/aokp.mk)

# nicki overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/nicki

# Setup device specific product configuration.
PRODUCT_NAME := aokp_nicki
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := nicki
PRODUCT_MODEL := XperiaM
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
