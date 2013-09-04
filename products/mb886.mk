# Inherit AOSP device configuration for mb886.
$(call inherit-product, device/motorola/mb886/full_mb886.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/motorola/mb886/overlay

# Setup device specific product configuration.
PRODUCT_NAME := aokp_mb886
PRODUCT_BRAND := Motorola
PRODUCT_DEVICE := mb886
PRODUCT_MODEL := Atrix HD
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mb886_gsm TARGET_DEVICE=mb886
BUILD_FINGERPRINT="motorola/MB886_att/qinara:4.1.1/9.8.0Q-97_MB886_FFW-20/27:user/release-keys"

# boot animation
PRODUCT_COPY_FILES += \
vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/boot/bootanimation-alt.zip
