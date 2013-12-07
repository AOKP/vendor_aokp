# Inherit AOSP device configuration for galaxys2.
$(call inherit-product, device/semc/haida/full_haida.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Haida overlay
PRODUCT_PACKAGE_OVERLAYS += device/semc/haida/overlay

# Setup device specific product configuration.
PRODUCT_DEVICE := haida
PRODUCT_NAME := aokp_haida
PRODUCT_BRAND := SEMC
PRODUCT_MODEL := Xperia Neo V

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=MT11i TARGET_DEVICE=MT11i BUILD_FINGERPRINT=SEMC/MT11i_1254-2184/MT11i:4.0.4/4.1.B.0.587/tL1_3w:user/release-keys PRIVATE_BUILD_DESC="MT11i-user 4.0.4 4.1.B.0.587 tL1_3w test-keys"
PRODUCT_RELEASE_NAME := MT11i

# Copy i9100 specific prebuilt files
PRODUCT_PACKAGES += \
    Thinkfree

PRODUCT_COPY_FILES += \
   vendor/aokp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation-alt.zip

