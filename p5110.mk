# Inherit AOSP device configuration for p5100
$(call inherit-product, device/samsung/p5110/full_p5110.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p5110
PRODUCT_NAME := aokp_p5110
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-P5110
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=espresso10wifixx TARGET_DEVICE=espresso10wifi BUILD_FINGERPRINT=samsung/espresso10wifixx/espresso10wifi:4.0.3/IML74K/P5110XWALD2:user/release-keys PRIVATE_BUILD_DESC="espresso10wifixx-user 4.0.3 IML74K P5110XWALD2 release-keys"

PRODUCT_RELEASE_NAME := p5110

# boot animation
# PRODUCT_COPY_FILES += \
#    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
