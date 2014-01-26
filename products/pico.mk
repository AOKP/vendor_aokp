# Inherit AOSP device configuration for mako
$(call inherit-product, device/htc/pico/pico.mk)

#Inherit AOKP common bits
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/pico/overlay

PRODUCT_RELEASE_NAME := Explorer

# Product name
PRODUCT_NAME := aokp_pico
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := pico
PRODUCT_MODEL := Explorer A310e
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=pico BUILD_FINGERPRINT=htc_europe/htc_pico/pico:2.3.5/GRJ90/207463.1:user/release-keys
PRIVATE_BUILD_DESC="1.28.401.1 CL207463 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_320_480.zip:system/media/bootanimation-alt.zip
