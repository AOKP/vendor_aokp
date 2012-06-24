# Inherit AOSP device configuration for Galaxy S3.
$(call inherit-product, device/samsung/i9300/full_i9300.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Galaxy S3 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/i9300

# Setup device specific product configuration.
PRODUCT_NAME := aokp_i9300
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := i9300
PRODUCT_MODEL := GT-I9300
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9300 BUILD_FINGERPRINT="samsung/m0xx/m0:4.0.4/IMM76D/I9300XXALE8:user/release-keys" PRIVATE_BUILD_DESC="m0xx-user 4.0.4 IMM76D I9300XXALE8 release-keys" 

# Copy Galaxy S3 specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip 

