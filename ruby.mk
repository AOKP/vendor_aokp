# Inherit AOSP device configuration for pyramid.
$(call inherit-product, device/htc/pyramid/full_ruby.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common_phone.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# pyramid overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/ruby

# Setup device specific product configuration.
PRODUCT_NAME    := ev_ruby
PRODUCT_BRAND   := HTC
PRODUCT_DEVICE  := ruby
PRODUCT_MODEL   := Amaze 4g
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_ruby BUILD_FINGERPRINT=tmous/htc_ruby/ruby:2.3.4/GRJ22/192596.3:user/release-keys PRIVATE_BUILD_DESC="1.43.531.3 CL83920 release-keys"

# Camera
PRODUCT_PACKAGES += \
    Camera

# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip

