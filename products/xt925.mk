# Inherit AOSP device configuration for xt925.
$(call inherit-product, device/motorola/xt925/full_xt925.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/motorola/xt925/overlay

# Setup device specific product configuration.
PRODUCT_NAME := aokp_xt925
PRODUCT_BRAND := Motorola
PRODUCT_DEVICE := xt925
PRODUCT_MODEL := Droid Razr HD
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=xt925_verizon TARGET_DEVICE=xt925
BUILD_FINGERPRINT="motorola/XT907_verizon/scorpion_mini:4.1.2/9.8.1Q-66/1Q-66/28:user/release-keys"

# boot animation
PRODUCT_COPY_FILES += \
vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/boot/bootanimation-alt.zip
