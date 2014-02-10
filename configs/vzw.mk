# Copy permissions and lib to particular pkg based on if unified device
# GMS ClientId base will be set as propert for vzw variant of unified device

ifeq ($(UNIFIED_DEVICE),true)
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/vzw/app/VerizonSSO.apk:system/proprietary/vzw/app/VerizonSSO.apk \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/proprietary/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/proprietary/vzw/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/proprietary/vzw/etc/permissions/com.vzw.vzwapnlib.xml \
    vendor/aokp/prebuilt/vzw/lib/libmotricity.so:system/proprietary/vzw/lib/libmotricity.so
else
PRODUCT_PACKAGES += \
    VerizonSSO

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/etc/permissions/com.vzw.vzwapnlib.xml \
    vendor/aokp/prebuilt/vzw/lib/libmotricity.so:system/lib/libmotricity.so

PRODUCT_GMS_CLIENTID_BASE := android-verizon
endif
