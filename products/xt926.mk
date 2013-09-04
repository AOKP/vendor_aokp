# Inherit AOSP device configuration for xt907.
$(call inherit-product, device/motorola/xt926/full_xt926.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aokp/configs/cdma.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aokp/configs/vzw.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/motorola/xt926/overlay

# Setup device specific product configuration.
PRODUCT_NAME := aokp_xt926
PRODUCT_BRAND := Motorola
PRODUCT_DEVICE := xt926
PRODUCT_MODEL := Droid Razr HD
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=xt926_verizon TARGET_DEVICE=xt926
BUILD_FINGERPRINT="motorola/XT907_verizon/scorpion_mini:4.1.2/9.8.1Q-66/1Q-66/28:user/release-keys"

# boot animation
PRODUCT_COPY_FILES += \
vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/boot/bootanimation-alt.zip
