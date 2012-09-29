$(call inherit-product, device/htc/primoc/full_primoc.mk)

PRODUCT_RELEASE_NAME := One_V

# Inherit some common AOKP stuff.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aokp/configs/cdma.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primoc BUILD_FINGERPRINT=virgin_mobile/htc_primoc/primou:4.1.1/JRO03L/330937:user/release-keys PRIVATE_BUILD_DESC="4.1.1 JRO03L 330937 release-keys"

PRODUCT_NAME := aokp_primoc
PRODUCT_DEVICE := primoc

# Bootanimation
PRODUCT_COPY_FILES += \
   vendor/aokp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip \
