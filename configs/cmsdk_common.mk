# Permissions for cmsdk services
PRODUCT_COPY_FILES += \
    vendor/aokp/configs/permissions/org.cyanogenmod.theme.xml:system/etc/permissions/org.cyanogenmod.theme.xml \
    vendor/aokp/configs/permissions/org.cyanogenmod.livelockscreen.xml:system/etc/permissions/org.cyanogenmod.livelockscreen.xml\
    vendor/aokp/configs/permissions/org.cyanogenmod.statusbar.xml:system/etc/permissions/org.cyanogenmod.statusbar.xml \
    vendor/aokp/configs/permissions/org.cyanogenmod.profiles.xml:system/etc/permissions/org.cyanogenmod.profiles.xml \
    vendor/aokp/configs/permissions/org.cyanogenmod.appsuggest.xml:system/etc/permissions/org.cyanogenmod.appsuggest.xml \
    vendor/aokp/configs/permissions/org.cyanogenmod.telephony.xml:system/etc/permissions/org.cyanogenmod.telephony.xml \
    vendor/aokp/configs/permissions/org.cyanogenmod.performance.xml:system/etc/permissions/org.cyanogenmod.performance.xml \
    vendor/aokp/configs/permissions/org.cyanogenmod.partner.xml:system/etc/permissions/org.cyanogenmod.partner.xml


# CM Platform Library
PRODUCT_PACKAGES += \
    org.cyanogenmod.platform-res \
    org.cyanogenmod.platform \
    org.cyanogenmod.platform.xml

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

ifndef CM_PLATFORM_SDK_VERSION
  # This is the canonical definition of the SDK version, which defines
  # the set of APIs and functionality available in the platform.  It
  # is a single integer that increases monotonically as updates to
  # the SDK are released.  It should only be incremented when the APIs for
  # the new release are frozen (so that developers don't write apps against
  # intermediate builds).
  CM_PLATFORM_SDK_VERSION := 5
endif

ifndef CM_PLATFORM_REV
  # For internal SDK revisions that are hotfixed/patched
  # Reset after each CM_PLATFORM_SDK_VERSION release
  # If you are doing a release and this is NOT 0, you are almost certainly doing it wrong
  CM_PLATFORM_REV := 0
endif

# CyanogenMod Platform SDK Version
PRODUCT_PROPERTY_OVERRIDES += \
  ro.aokp.build.version.plat.sdk=$(CM_PLATFORM_SDK_VERSION)

# CyanogenMod Platform Internal
PRODUCT_PROPERTY_OVERRIDES += \
  ro.aokp.build.version.plat.rev=$(CM_PLATFORM_REV)

