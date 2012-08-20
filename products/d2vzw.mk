# Inherit AOSP device configuration for pyramid.
$(call inherit-product, device/samsung/d2vzw/full_d2vzw.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)


PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/d2-common

# Setup device specific product configuration.
PRODUCT_NAME := aokp_d2vzw
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := d2vzw
PRODUCT_MODEL := SCH-I535
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d2vzw TARGET_DEVICE=d2vzw BUILD_FINGERPRINT="d2vzw-user 4.1.1 JRO03H T999UVALEM release-keys" PRIVATE_BUILD_DESC="samsung/d2vzw/d2vzw:4.1.1/JRO03H/T999UVALEM:user/release-keys"

# Camera
PRODUCT_PACKAGES += \
    Camera

# boot animation
PRODUCT_COPY_FILES += \
vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip

