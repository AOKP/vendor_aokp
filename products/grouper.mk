# Inherit AOSP device configuration for grouper
$(call inherit-product, device/asus/grouper/full_grouper.mk)

# Inherit AOKP common_tablet bits
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Grouper Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/grouper

# Setup device specific product configuration.
PRODUCT_NAME := aokp_grouper
PRODUCT_BRAND := Google
PRODUCT_DEVICE := grouper
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=nakasi BUILD_FINGERPRINT=google/nakasi/grouper:4.4.3/KTU84L/1148727:user/release-keys PRIVATE_BUILD_DESC="nakasi-user 4.4.3 KTU84L 1148727 release-keys" BUILD_NUMBER=573038

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_800.zip:system/media/bootanimation.zip
