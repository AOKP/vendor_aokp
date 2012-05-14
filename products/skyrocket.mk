# Inherit AOSP device configuration for pyramid.
$(call inherit-product, device/samsung/hercules/full_hercules.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# skyrocket overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/skyrocket

# Setup device specific product configuration.
PRODUCT_NAME := aokp_skyrocket
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := hercules
PRODUCT_MODEL := SGH-I717
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=samsung_skyrocket BUILD_FINGERPRINT="samsung/SGH-I727/SGH-I727:4.0.4/IML74K/107:user/release-keys" PRIVATE_BUILD_DESC="SGH-I727-user 4.0.4 IML74K 107 release-keys"

# Camera
PRODUCT_PACKAGES += \
    Camera

# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip

