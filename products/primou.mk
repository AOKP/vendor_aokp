$(call inherit-product, device/htc/primou/full_primou.mk)

PRODUCT_RELEASE_NAME := One_V

# Inherit some common CM stuff.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aokp/configs/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primou BUILD_FINGERPRINT=htc_europe/htc_primou/primou:4.1.1/JRO03L/330937:user/release-keys PRIVATE_BUILD_DESC="4.1.1 JRO03L 330937 release-keys"

PRODUCT_NAME := aokp_primou
PRODUCT_DEVICE := primou

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip
