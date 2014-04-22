# Inherit AOSP device configuration for tenderloin
$(call inherit-product, device/hp/tenderloin/full_tenderloin.mk)

# Inherit AOKP common bits
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Tenderloin Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/common_tablet

# Setup device specific product configuration
PRODUCT_NAME := aokp_tenderloin
PRODUCT_BRAND := HP
PRODUCT_DEVICE := tenderloin
PRODUCT_MODEL := TouchPad
PRODUCT_MANUFACTURER := hp

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=touchpad BUILD_FINGERPRINT=hp/hp_tenderloin/tenderloin:4.4.2/KOT49H/937116:user/release-keys PRIVATE_BUILD_DESC="tenderloin-user 4.4.2 KOT49H 937116 release-keys"

PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip
