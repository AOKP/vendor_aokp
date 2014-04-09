$(call inherit-product, device/htc/m7/full_m7.mk)

$(call inherit-product, vendor/aokp/configs/gsm.mk)

$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
BUILD_ID=KOT49H.H1 BUILD_FINGERPRINT="htc/m7_google/m7:4.4.2/KOT49H.H1/288144:user/release-keys" \
PRIVATE_BUILD_DESC="3.62.1700.1 CL288144 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip

PRODUCT_NAME := aokp_m7
PRODUCT_DEVICE := m7

