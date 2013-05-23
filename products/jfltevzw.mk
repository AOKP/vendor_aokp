# Inherit AOSP device configuration for jflteusc
$(call inherit-product, device/samsung/jfltevzw/full_jfltevzw.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aokp/configs/cdma.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := aokp_jfltevzw
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := jfltevzw
PRODUCT_MODEL := SCH-I545
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltevzw TARGET_DEVICE=jfltevzw BUILD_FINGERPRINT="samsung/jfltevzw/jfltevzw:4.2.2/JDQ39/I545VRUAMDK:user/release-keys" 
PRIVATE_BUILD_DESC="jfltevzw-user 4.2.2 JDQ39 I545VRUAMDK release-keys"

# boot animation
PRODUCT_COPY_FILES += \
       vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
