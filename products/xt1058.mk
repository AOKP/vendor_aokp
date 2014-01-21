# Inherit AOSP device configuration for xt1058
$(call inherit-product, device/motorola/xt1058/full_xt1058.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit common jf overlays
DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/ghost

# Setup device specific product configuration.
PRODUCT_NAME := aokp_xt1058
PRODUCT_BRAND := GSM
PRODUCT_DEVICE := xt1058
PRODUCT_MODEL := xt1058
PRODUCT_MANUFACTURER := motorola
PRODUCT_RELEASE_NAME := Moto X

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=motorola \
    PRODUCT_NAME=XT1058_gsm \
    BUILD_PRODUCT=ghost \
    BUILD_FINGERPRINT=motorola/XT1058_gsm/ghost:4.2.2/13.9.0Q2.X-116:user/release-keys

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
