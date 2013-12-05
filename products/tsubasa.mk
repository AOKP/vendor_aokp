# Inherit AOSP device configuration for tsubasa
$(call inherit-product, device/sony/tsubasa/aokp.mk)

# tsubasa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/tsubasa

# Setup device specific product configuration.
PRODUCT_NAME := aokp_tsubasa
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := tsubasa
PRODUCT_MODEL := LT25i
PRODUCT_MANUFACTURER := Sony

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true


# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
