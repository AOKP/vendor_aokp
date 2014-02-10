PRODUCT_PACKAGES += \
    VerizonSSO \
    CellBroadcastReceiver

# Copy permissions and lib to particular pkg based on if unified device
# GMS ClientId base will be set as propert for vzw variant of unified device
ifneq ($(TARGET_UNIFIED_DEVICE),)
    PRODUCT_COPY_FILES += \
        vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/proprietary/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml \
        vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/proprietary/vzw/etc/permissions/com.vzw.hardware.lte.xml \
        vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/proprietary/vzw/etc/permissions/com.vzw.vzwapnlib.xml \
        vendor/aokp/prebuilt/vzw/lib/libmotricity.so:system/proprietary/vzw/lib/libmotricity.so
else
    PRODUCT_COPY_FILES += \
        vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/etc/permissions/com.vzw.hardware.ehrpd.xml \
        vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/etc/permissions/com.vzw.hardware.lte.xml \
        vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/etc/permissions/com.vzw.vzwapnlib.xml \
        vendor/aokp/prebuilt/vzw/lib/libmotricity.so:system/lib/libmotricity.so

    PRODUCT_GMS_CLIENTID_BASE := android-verizon
endif
