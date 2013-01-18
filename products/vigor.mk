# Inherit common Verizon Wireless Perms and Lib
$(call inherit-product, vendor/aokp/configs/vzw.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aokp/configs/cdma.mk)

$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Bootanimation
TARGET_BOOTANIMATION_NAME := vertical-720x1280
$(call inherit-product, device/htc/vigor/vigor.mk)

# Device naming
PRODUCT_NAME := aokp_vigor
PRODUCT_DEVICE := vigor
PRODUCT_MODEL := ADR6425LVW
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vigor BUILD_ID=IML74K BUILD_FINGERPRINT="verizon_wwe/htc_vigor/vigor:4.0.3/IML74K/372320.10:user/release-keys" PRIVATE_BUILD_DESC="3.14.605.10 CL372320 release-keys"

# Release name
PRODUCT_RELEASE_NAME := Vigor
-include vendor/aokp/configs/common_versions.mk

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation.zip
