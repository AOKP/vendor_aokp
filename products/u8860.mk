# Specify phone tech before including full_phone
$(call inherit-product, vendor/aokp/configs/gsm.mk)

$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/u8860/full_u8860.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=u8860 BUILD_ID=JWR66V.H10 BUILD_FINGERPRINT="huawei/u8860_google/u8860:4.3/JWR66V.H10/230993:user/release-keys" PRIVATE_BUILD_DESC="3.06.1700.10 CL230993 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation-alt.zip

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip

# Device naming
PRODUCT_DEVICE := u8860
PRODUCT_NAME := mighty_u8860
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Huawei Honor
PRODUCT_MANUFACTURER := Huawei
