$(call inherit-product, vendor/aokp/configs/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/aokp/configs/telephony.mk)