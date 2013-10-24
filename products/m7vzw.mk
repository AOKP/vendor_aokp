# Specify phone tech first before full device
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit common AOKP stuff
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit AOSP configuration
$(call inherit-product, device/htc/m7vzw/full_m7vzw.mk)

# Inherit common VZW stuff Inherit common Verizon Wireless Perms 
# and Lib
#$(call inherit-product, vendor/aokp/configs/vzw.mk) 

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=HTCOneVZW BUILD_ID=JDQ39 BUILD_FINGERPRINT="VERIZON/HTCOneVZW/m7wlv:4.2.2/JDQ39/221778.10:user/release-keys" PRIVATE_BUILD_DESC="1.10.605.10 CL221778 release-keys"

PRODUCT_NAME := aokp_m7vzw
PRODUCT_DEVICE := m7vzw
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One
PRODUCT_MANUFACTURER := HTC

# boot animation
PRODUCT_COPY_FILES += \
vendor/aokp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip
