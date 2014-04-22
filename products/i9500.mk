$(call inherit-product, device/samsung/i9500/aokp_i9500.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_NAME := aokp_i9500
PRODUCT_DEVICE := i9500

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=GT-I9500 \
    PRODUCT_NAME=ja3gxx \
    PRODUCT_DEVICE=ja3g \
    TARGET_DEVICE=ja3g \
    BUILD_FINGERPRINT="samsung/ja3gxx/ja3g:4.4.2/KOT49H/I9500XXUFNB3:user/release-keys" \
    PRIVATE_BUILD_DESC="ja3gxx-user 4.4.2 KOT49H I9500XXUFNB3 release-keys"

PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080.zip:system/media/bootanimation.zip