# Inherit AOSP device configuration for vigor.
$(call inherit-product, device/htc/vigor/vigor.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# vigor overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/vigor

# Setup device specific product configuration.
PRODUCT_NAME := aokp_vigor
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := vigor
PRODUCT_MODEL := PG86100
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vigor BUILD_ID=IML74K BUILD_FINGERPRINT="sprint/htc_shooter/shooter:4.0.3/IML74K/130920.2:user/release-keys" PRIVATE_BUILD_DESC="2.08.651.2 CL130920 release-keys"

# Camera
PRODUCT_PACKAGES += \
    Camera

# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip

