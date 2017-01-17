PRODUCT_BRAND ?= aokp

SUPERUSER_EMBEDDED := true

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/dictionaries

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true

#SELinux
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Enable Google Assistant on all devices.
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.opa.eligible_device=true

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aokp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aokp/prebuilt/common/bin/50-aokp.sh:system/addon.d/50-aokp.sh \
    vendor/aokp/prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    vendor/aokp/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/aokp/prebuilt/common/etc/backup.conf:system/etc/backup.conf

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/aokp/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/aokp/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aokp/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Lineage-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/aokp/configs/permissions/lineage-sysconfig.xml:system/etc/sysconfig/lineage-sysconfig.xml

PRODUCT_COPY_FILES += \
    vendor/aokp/configs/permissions/org.lineageos.android.xml:system/etc/permissions/org.lineageos.android.xml \
    vendor/aokp/configs/permissions/privapp-permissions-lineage.xml:system/etc/permissions/privapp-permissions-lineage.xml \
    vendor/aokp/configs/permissions/com.aokp.android.xml:system/etc/permissions/com.aokp.android.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/aokp/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/aokp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/aokp/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Copy all Lineage-specific init rc files
$(foreach f,$(wildcard vendor/aokp/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Installer
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/aokp/prebuilt/common/etc/persist.conf:system/etc/persist.conf

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/aokp/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Include audio files
include vendor/aokp/configs/audio.mk

ifneq ($(TARGET_DISABLE_LINEAGE_SDK), true)
# Lineage SDK
include vendor/aokp/configs/lineage_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/aokp/configs/twrp.mk
endif

# Required AOKP packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CellBroadcastReceiver \
    Development \
    masquerade \
    mGerrit \
    Microbes \
    ROMControl \
    Stk \
    ThemeInterfacer

# Optional AOKP packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable \
    Terminal

# OmniRom packages
PRODUCT_PACKAGES += \
    OmniJaws \
    OmniStyle

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom Lineage packages
PRODUCT_PACKAGES += \
    AudioFX \
    Eleven \
    ExactCalculator \
    Jelly \
    LineageParts \
    LineageSettingsProvider \
    SetupWizard \
    Trebuchet \
    WallpaperPicker \
    WeatherProvider

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Berry styles
PRODUCT_PACKAGES += \
    LineageDarkTheme \
    LineageBlackAccent \
    LineageBlueAccent \
    LineageBrownAccent \
    LineageCyanAccent \
    LineageGreenAccent \
    LineageOrangeAccent \
    LineagePinkAccent \
    LineagePurpleAccent \
    LineageRedAccent \
    LineageYellowAccent

# Extra tools in CM
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    nano \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_LINEAGE_CHARGER),true)
PRODUCT_PACKAGES += \
    lineage_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# exFAT tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank

    # Option to exclude superuser per target
    ifneq ($(TARGET_DISABLE_SUPERUSER), true)
    PRODUCT_PACKAGES += \
        su
    endif
endif

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.root_access=3

# OMS
#PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
#    ro.substratum.verified=true

# Common overlay
DEVICE_PACKAGE_OVERLAYS += vendor/aokp/overlay/common

PRODUCT_VERSION_MAJOR = 15
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

AOKP_BUILD_DATE := $(shell LC_ALL=C date +%Y-%m-%d_%H%M)
AOKP_BRANCH=oreo

ifneq ($(AOKP_BUILD),)
    # AOKP_BUILD=<goo version int>/<build string>
    PRODUCT_GENERIC_PROPERTIES += \
        ro.goo.developerid=aokp \
        ro.goo.rom=aokp \
        ro.goo.version=$(shell echo $(AOKP_BUILD) | cut -d/ -f1)
else
    ifeq ($(AOKP_BUILDTYPE),)
        # AOKP_BUILDTYPE not defined
        AOKP_BUILDTYPE := unofficial
    endif
endif

AOKP_VERSION=$(TARGET_PRODUCT)_$(AOKP_BRANCH)_$(AOKP_BUILDTYPE)_$(AOKP_BUILD_DATE)
AOKP_DISPLAY_VERSION := $(AOKP_VERSION)

PRODUCT_GENERIC_PROPERTIES += \
    ro.aokp.version=$(AOKP_VERSION) \
    ro.aokp.branch=$(AOKP_BRANCH) \
    ro.aokp.device=$(AOKP_DEVICE) \
    ro.aokp.releasetype=$(AOKP_BUILDTYPE) \
    ro.modversion=$(AOKP_VERSION) \
    ro.aokp.display.version=$(AOKP_DISPLAY_VERSION)

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/aokp/build/target/product/security/aokp-releasekey

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/aokp/configs/partner_gms.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
