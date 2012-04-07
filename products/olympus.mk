# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

## Inherit some common AOKP stuff.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

## Inherit device configuration
$(call inherit-product, device/moto/olympus/olympus.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aokp_olympus
PRODUCT_DEVICE := olympus
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := MB860

## Release name
PRODUCT_RELEASE_NAME := Atrix

## Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_BRAND=MOTO PRODUCT_MANUFACTURER=Motorola PRODUCT_NAME=olyatt BUILD_PRODUCT=olyatt BUILD_FINGERPRINT=MOTO/olyatt/olympus:2.3.4/4.5.91/110625:user/release-keys PRIVATE_BUILD_DESC="olympus-user 2.3.4 4.5.91 110625 release-keys"

# Copy maguro specific prebuilt files
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip \
