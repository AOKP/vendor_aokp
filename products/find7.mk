$(call inherit-product, device/oppo/find7/full_find7.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/find7

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := find7
PRODUCT_NAME := aokp_find7

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=4.4.2/KVT49L/1390465867:user/release-keys PRIVATE_BUILD_DESC="msm8974-user 4.4.2 KVT49L eng.root.20141017.144947 release-keys"
