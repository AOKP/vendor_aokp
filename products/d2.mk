# Inherit AOSP device configuration for d2
$(call inherit-product, device/samsung/d2vzw/full_d2.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aokp/configs/vzw.mk)

# Inherit common d2 overlays
DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/samsung/d2 \
                           vendor/aokp/overlay/samsung/msm8960-common \
                           vendor/aokp/overlay/samsung/qcom-common

# Setup device specific product configuration.
PRODUCT_NAME := aokp_d2
PRODUCT_DEVICE := d2

# boot animation
PRODUCT_COPY_FILES += \
vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
