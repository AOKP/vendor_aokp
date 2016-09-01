# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit device configuration for Kindle Fire
$(call inherit-product, device/amazon/otter/full_otter.mk)
$(call inherit-product, device/amazon/otter-common/aokp.mk)

PRODUCT_NAME := aokp_otter
PRODUCT_DEVICE := otter
PRODUCT_MODEL := Amazon Kindle Fire
PRODUCT_RELEASE_NAME := KFire
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Amazon

