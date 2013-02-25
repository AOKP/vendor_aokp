# Inherit AOSP device configuration for saga.
$(call inherit-product, device/htc/saga/full_saga.mk)

# Inherit AOKP common bits
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Saga Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/saga

# Setup device specific product configuration.
PRODUCT_NAME := aokp_saga
PRODUCT_BRAND := htc
PRODUCT_DEVICE := saga
PRODUCT_MODEL := Desire S
PRODUCT_MANUFACTURER := htc

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=saga BUILD_FINGERPRINT=htc/saga/saga:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="saga-user 4.1.1 JRO03C 398337 release-keys" BUILD_NUMBER=398337

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip
