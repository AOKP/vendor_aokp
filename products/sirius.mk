# Inherit AOSP device configuration for sirius
$(call inherit-product-if-exists, device/sony/sirius/aokp.mk)

# sirius overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/sirius

# Setup device specific product configuration.
PRODUCT_NAME := aokp_sirius
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := sirius
PRODUCT_MODEL := Xperia Z2
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
