# Inherit AOSP device configuration for i317.
$(call inherit-product, device/samsung/t0att/full_t0att.mk)

# Inherit AOKP common bits
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Setup device specific product configuration.
PRODUCT_NAME := aokp_t0att
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := t0att
PRODUCT_MODEL := SGH-I317
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0att TARGET_DEVICE=t0att BUILD_FINGERPRINT="samsung/t0lteatt/t0lteatt:4.1.1/JR003C/I317UCALJ2:user/release-keys" PRIVATE_BUILD_DESC="t0lteatt-user 4.1.1 JR003c I317UCALJ2 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip
