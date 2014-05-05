# Inherit AOSP device configuration for amami
$(call inherit-product-if-exists, device/sony/amami/aokp.mk)

# amami overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/amami

# Setup device specific product configuration.
PRODUCT_NAME := aokp_amami
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := amami
PRODUCT_MODEL := Xperia Z1 compact
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720.zip:system/media/bootanimation.zip
