# Resolution values for bootanimation
TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 1920

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit device configuration for tf700t.
$(call inherit-product, device/asus/tf700t/full_tf700t.mk)

#
# Setup device specific product configuration.
#
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := aokp_tf700t
PRODUCT_BRAND := asus
PRODUCT_DEVICE := tf700t
PRODUCT_MODEL := ASUS Transformer Pad TF700T
PRODUCT_MANUFACTURER := asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=EeePad BUILD_FINGERPRINT=asus/US_epad/EeePad:4.2.1/JOP40D/US_epad-10.6.1.14.10-20130801:user/release-keys PRIVATE_BUILD_DESC="US_epad-user 4.2.1 JOP40D US_epad-10.6.1.14.10-20130801 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := TF700T
