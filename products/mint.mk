# Inherit AOKP device configuration for mint
$(call inherit-product, device/sony/mint/aokp.mk)

# mint overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/mint

# Setup device specific product configuration.
PRODUCT_NAME := aokp_mint
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := mint
PRODUCT_MODEL := LT30p
PRODUCT_MANUFACTURER := Sony

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true


# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
