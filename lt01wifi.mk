# Copyright (C) 2013 OmniROM Project
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Release name
PRODUCT_RELEASE_NAME := lt01wifi

# Inherit AOKP common_tablet bits
$(call inherit-product, vendor/aokp/configs/common_tablet.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/lt01wifi/full_lt01wifi.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := lt01wifi
PRODUCT_NAME := aokp_lt01wifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T310
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lt01wifiue TARGET_DEVICE=lt01wifi BUILD_FINGERPRINT="samsung/lt01wifiue/lt01wifi:4.2.2/JDQ39/T310UEUAMH2:user/release-keys" PRIVATE_BUILD_DESC="lt01wifiue-user 4.2.2 JDQ39 T310UEUAMH2 release-keys"
