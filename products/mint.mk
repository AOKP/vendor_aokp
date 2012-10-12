# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit AOSP device configuration for anzu
$(call inherit-product-if-exists, device/sony/mint/full_mint.mk)

# mint overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/mint

# Setup device specific product configuration.
PRODUCT_NAME := aokp_mint
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := mint
PRODUCT_MODEL := Xperia T
PRODUCT_MANUFACTURER := Sony

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT30p_1266-0471 BUILD_FINGERPRINT=Sony/LT30p_1266-0471/LT30p:4.0.4/7.0.A.1.303/0Pr_xw:user/release-keys PRIVATE_BUILD_DESC="LT30p-user 4.0.4 7.0.A.1.303 0Pr_xw test-keys"

# Camera
PRODUCT_PACKAGES += \
    Camera \
    Mms \
    Music

# Copy mint specific prebuilt files
PRODUCT_PACKAGES += \
    ThinkFree

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip

# Hardware Info
PRODUCT_PROPERTY_OVERRIDES += \
    ro.device.cpu=Snapdragon_S4_Krait \
    ro.device.front_cam=1.3MP \
    ro.device.gpu=Adreno_225 \
    ro.device.rear_cam=13MP \
    ro.device.screen_res=720x1280_Pixels
