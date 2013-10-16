# Specify phone tech before including full_phone
$(call inherit-product, vendor/aokp/configs/cdma.mk)

$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/htc/dlx/full_dlx.mk)

#Inherit common VZW Permissions and Libs
$(call inherit-product, vendor/aokp/configs/vzw.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=dlx BUILD_FINGERPRINT=verizon_wwe/dlx/dlx:4.1.1/JRO03C/147796.1:user/release-keys PRIVATE_BUILD_DESC="2.06.605.1 CL147796 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

# Device naming
PRODUCT_DEVICE := dlx
PRODUCT_NAME := aokp_dlx
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC Droid DNA
PRODUCT_MANUFACTURER := HTC
