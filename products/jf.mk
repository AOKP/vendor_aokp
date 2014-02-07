# Inherit AOSP device configuration for jf
$(call inherit-product, device/samsung/jf/full_jf.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit common jf overlays
DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/samsung/jf \
                           vendor/aokp/overlay/samsung/msm8960-common \
                           vendor/aokp/overlay/samsung/qcom-common

# Setup device specific product configuration.
PRODUCT_NAME := aokp_jf
PRODUCT_DEVICE := jf

# boot animation
PRODUCT_COPY_FILES += \
       vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
