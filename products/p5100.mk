# Inherit AOKP common_tablet bits
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/p3110/full_p3110.mk)

# Setup device specific product configuration
PRODUCT_DEVICE := p5100
PRODUCT_NAME := aokp_p5100
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P5100
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=espresso10rfxx TARGET_DEVICE=espresso10rf BUILD_FINGERPRINT=samsung/espresso10rfxx/espresso10rf:4.0.3/IML74K/P5100XWALE2:user/release-keys PRIVATE_BUILD_DESC="espresso10rfxx-user 4.0.3 IML74K P5100XWALE2 release-keys"

PRODUCT_RELEASE_NAME := GT-P5100
