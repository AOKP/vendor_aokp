# Inherit AOKP common_tablet bits
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/p3110/full_p3110.mk)

# Setup device specific product configuration
PRODUCT_NAME := aokp_p3110
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P3110
PRODUCT_MANUFACTURER := samsung
PRODUCT_DEVICE := p3110

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=espressowifixx \
    TARGET_DEVICE=espressowifi \
    BUILD_FINGERPRINT="samsung/espressowifixx/espressowifi:4.2.2/JDQ39/P3110XXDMH1:user/release-keys" \
    PRIVATE_BUILD_DESC="espressowifixx-user 4.2.2 JDQ39 P3110XXDMH1 release-keys"

PRODUCT_RELEASE_NAME := GT-P3110
