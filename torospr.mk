# Inherit AOSP device configuration for toro.
$(call inherit-product, device/samsung/toro/full_toroplus.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Tuna overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/tuna
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/maguro

# Setup device specific product configuration.
PRODUCT_NAME := aokp_toro
PRODUCT_BRAND := google
PRODUCT_DEVICE := toro
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES :=  PRODUCT_NAME=yakju BUILD_FINGERPRINT="google/yakju/maguro:4.0.4/IMM76D/299849:user/release-keys" PRIVATE_BUILD_DESC="yakju-user 4.0.4 IMM76D 299849 release-keys"

# Copy toro specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/xhdpi/bootanimation.zip:system/media/bootanimation.zip


