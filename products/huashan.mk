# Inherit AOSP device configuration for huashan
$(call inherit-product, device/sony/huashan/full_huashan.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# huashan overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/huashan

# Setup device specific product configuration.
PRODUCT_NAME := aokp_huashan
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := huashan
PRODUCT_MODEL := Xperia SP
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C5303_1272-3352 BUILD_FINGERPRINT=Sony/C5303_1272-3352/C5303:4.1.2/12.0.A.2.254/Aff_nw:user/release-keys PRIVATE_BUILD_DESC="C5303-user 4.1.2 12.0.A.2.254 Aff_nw test-keys"

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true


# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
