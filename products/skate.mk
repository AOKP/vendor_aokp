# Inherit AOSP device configuration for skate.
$(call inherit-product, device/zte/skate/skate.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# pyramid overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/skate

# Setup device specific product configuration.
PRODUCT_NAME := aokp_skate
PRODUCT_BRAND := ZTE
PRODUCT_DEVICE := skate
PRODUCT_MODEL := Skate
PRODUCT_MANUFACTURER := ZTE

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=yakju BUILD_FINGERPRINT=google/yakju/maguro:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="yakju-user 4.0.4 IMM76D 299849 release-keys" BUILD_NUMBER=299849

# Camera
PRODUCT_PACKAGES += \
    Camera \
    Music

# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip
