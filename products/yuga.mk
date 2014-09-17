# Inherit AOSP device configuration for yuga
$(call inherit-product-if-exists, device/sony/yuga/aokp.mk)

# yuga overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/yuga

# Setup device specific product configuration.
PRODUCT_NAME := aokp_yuga
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := yuga
PRODUCT_MODEL := Xperia Z
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6603 BUILD_FINGERPRINT=Sony/C6603_1270-6697/C6603:4.4.2/10.5.A.0.230/WP5_rg:user/release-keys PRIVATE_BUILD_DESC="yuga-userdebug 4.4.2 10.5.A.0.230 WP5_rg test-keys"

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
