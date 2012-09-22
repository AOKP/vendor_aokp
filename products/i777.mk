# Inherit AOSP device configuration for galaxys2.
$(call inherit-product, device/samsung/i777/full_i777.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# SGS2 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/i777

# Setup device specific product configuration.
PRODUCT_DEVICE := i777
PRODUCT_NAME := aokp_i777
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SGH-i777

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-i777 TARGET_DEVICE=SGH-i777 BUILD_FINGERPRINT=samsung/GT-I9100/GT-I9100:4.1.1/JRO03L/XXLPQ:user/release-keys PRIVATE_BUILD_DESC="GT-I9100-user 4.1.1 JRO03L XXLPQ release-keys"
PRODUCT_RELEASE_NAME := SGH-i777

# Copy i9100 specific prebuilt files
PRODUCT_PACKAGES += \
    Thinkfree

PRODUCT_COPY_FILES += \
   vendor/aokp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip

