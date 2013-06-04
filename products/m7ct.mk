# Specify phone tech before including full_phone
$(call inherit-product, vendor/aokp/configs/gsm.mk)
$(call inherit-product, vendor/aokp/configs/cdma.mk)
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/htc/m7ct/full_m7ct.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=m7cdwg BUILD_ID=JZO54K BUILD_FINGERPRINT="htccn_chs_ct/m7cdwg/m7cdwg:4.1.2/JZO54K/186762.2:user/release-keys" PRIVATE_BUILD_DESC="1.11.1401.2 CL186762 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

# Device naming
PRODUCT_DEVICE := m7ct
PRODUCT_NAME := aokp_m7ct
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One
PRODUCT_MANUFACTURER := HTC




