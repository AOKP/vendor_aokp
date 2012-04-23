$(call inherit-product, device/acer/picasso/picasso.mk)

$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit common build.prop overrides
-include vendor/aokp/products/common_versions.mk

# Set those variables here to overwrite the inherited values.

PRODUCT_NAME := aokp_picasso
PRODUCT_DEVICE := picasso
PRODUCT_BRAND := Acer
PRODUCT_MODEL := A500
PRODUCT_MANUFACTURER := Acer

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=picasso \
    BUILD_FINGERPRINT="acer/a500_ww_gen1/picasso:4.0.3/IML74K/1329824557:user/release-keys" \
    PRIVATE_BUILD_DESC="a500_ww_gen1-user 4.0.3 IML74K 1329824557 release-keys"


PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip
