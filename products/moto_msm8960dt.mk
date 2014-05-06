$(call inherit-product, device/motorola/moto_msm8960dt/full_moto_msm8960dt.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

# boot animation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720.zip:system/media/bootanimation.zip

PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/moto_msm8960dt

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := moto_msm8960dt
PRODUCT_NAME := aokp_moto_msm8960dt

