# Inherit AOKP common_tablet bits
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/p3110/full_p3110.mk)

# Setup device specific product configuration
PRODUCT_NAME := aokp_p3110
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P3110
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=espressowifixx TARGET_DEVICE=espressowifi BUILD_FINGERPRINT="samsung/espressowifixx/espressowifi:4.0.3/IML74K/P3110XWALD2"
PRIVATE_BUILD_DESC="espressowifixx-user 4.0.3 IML74K P3110XWALD2 release-keys"

PRODUCT_RELEASE_NAME := GT-P3110
