# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit AOSP device configuration for anzu
$(call inherit-product-if-exists, device/sony/honami/full_honami.mk)

# Setup device specific product configuration.
PRODUCT_NAME := mighty_honami
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := honami
PRODUCT_MODEL := Xperia Z1
PRODUCT_MANUFACTURER := Sony

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6903 BUILD_FINGERPRINT=Sony/C6903_1276-7948/C6903:4.2.2/14.1.G.1.526/8Xl-jw:user/release-keys PRIVATE_BUILD_DESC="C6903-user 4.2.2 14.1.G.1.526 8Xl-jw test-keys"

# Camera
PRODUCT_PACKAGES += \
    Camera \
    Mms \
    Music

# Copy anzu specific prebuilt files
PRODUCT_PACKAGES += \
    ThinkFree  

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip