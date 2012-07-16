$(call inherit-product, vendor/aokp/configs/common.mk)

#BUILD_PREBUILT += \
PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/common/app/NovaLauncher.apk:system/app/NovaLauncher.apk


# Inherit drm blobs
-include vendor/aokp/configs/common_drm_phone.mk

