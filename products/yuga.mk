# Inherit AOSP device configuration for yuga
$(call inherit-product-if-exists, device/sony/yuga/aokp.mk)

# yuga overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/yuga

# Setup device specific product configuration.
PRODUCT_NAME := aokp_yuga
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := yuga
PRODUCT_MODEL := C6603
PRODUCT_MANUFACTURER := Sony

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
