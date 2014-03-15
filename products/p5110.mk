# Inherit AOKP common_tablet bits
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/p5110/full_p5110.mk)

# Setup device specific product configuration
PRODUCT_DEVICE := p5110
PRODUCT_NAME := aokp_p5110
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P5110
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=espresso10wifixx \
    TARGET_DEVICE=espresso10wifi \
    BUILD_FINGERPRINT="samsung/espresso10wifixx/espresso10wifi:4.2.2/JDQ39/P5110XXDML1:user/release-keys" \
    PRIVATE_BUILD_DESC="espresso10wifixx-user 4.2.2 JDQ39 P5110XXDML1 release-keys"

PRODUCT_RELEASE_NAME := p5110
