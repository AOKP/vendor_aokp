$(call inherit-product, device/oppo/find7a/full_find7a.mk)

# Inherit some common AOKP stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)
$(call inherit-product, vendor/aokp/configs/common.mk)

PRODUCT_NAME := aokp_find7a
PRODUCT_DEVICE := find7a

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=4.3/JLS36C/1390381364:user/release-keys PRIVATE_BUILD_DESC="msm8974-user 4.3 JLS36C eng.root.20140122.170107 release-keys"
