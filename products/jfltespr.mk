$(call inherit-product, device/samsung/jfltespr/full_jfltespr.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aokp/configs/cdma.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := aokp_jfltespr
PRODUCT_DEVICE := jfltespr
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SPH-L720
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltespr TARGET_DEVICE=jfltespr BUILD_FINGERPRINT="samsung/jfltespr/jfltespr:4.2.2/JDQ39/L720VPUAMDC:user/release-keys" PRIVATE_BUILD_DESC="jfltespr-user 4.2.2 JDQ39 L720VPUAMDC release-keys"

# boot animation 
PRODUCT_COPY_FILES += \
       vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
