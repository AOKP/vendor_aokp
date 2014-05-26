# Inherit device configuration
$(call inherit-product, device/semc/urushi/full_urushi.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit some common AOKP stuff.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_480.zip:system/media/bootanimation.zip

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=ST18i \
    PRODUCT_DEVICE=ST18i \
    BUILD_FINGERPRINT="SEMC/ST18i_1254-2184/ST18i:4.0.4/4.1.B.0.587/tL1_3w:user/release-keys" \
    PRIVATE_BUILD_DESC="ST18i-user 4.0.4 4.1.B.0.587 tL1_3w test-keys"

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aokp_urushi
PRODUCT_GMS_CLIENTID_BASE := android-sonyericsson
