# Inherit AOSP device configuration for toro.
$(call inherit-product, device/samsung/toro/full_toro.mk)

# Inherit AOKP common bits
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit common Verizon Wireless Files
$(call inherit-product, vendor/aokp/configs/vzw.mk)

# Tuna Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/tuna

# Setup device specific product configuration.
PRODUCT_NAME := aokp_toro
PRODUCT_BRAND := google
PRODUCT_DEVICE := toro
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mysid BUILD_FINGERPRINT="google/mysid/toro:4.3/JWR66V/737497:user/release-keys" PRIVATE_BUILD_DESC="mysid-user 4.3 JWR66V 737497 release-keys" BUILD_NUMBER=125147

# Toro specific packages
PRODUCT_PACKAGES += \
    Thinkfree

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720.zip:system/media/bootanimation.zip
