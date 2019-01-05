#
# Copyright (C) 2014 The CyanogenMod Project
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
#

# Only include Shield apps for first party targets
ifneq ($(filter $(word 2,$(subst _, ,$(TARGET_PRODUCT))), shieldtablet jetson),)
$(call inherit-product, device/nvidia/shield-common/shield.mk)
endif

TARGET_REFERENCE_DEVICE ?= shieldtablet
TARGET_TEGRA_VARIANT    ?= common

$(call inherit-product, device/nvidia/t124-common/t124.mk)
$(call inherit-product, device/nvidia/icera/icera.mk)
$(call inherit-product, device/nvidia/touch/raydium.mk)

PRODUCT_CHARACTERISTICS  := tablet
PRODUCT_AAPT_CONFIG      := xlarge large
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT     := 1920
TARGET_SCREEN_WIDTH      := 1200

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Init related
PRODUCT_PACKAGES += \
    fstab.ardbeg \
    fstab.jetson-tk1 \
    fstab.loki \
    fstab.tn8 \
    init.recovery.ardbeg.rc \
    init.recovery.jetson-tk1.rc \
    init.recovery.loki.rc \
    init.recovery.tn8.rc \
    init.ardbeg.rc \
    init.jetson-tk1.rc \
    init.loki.rc \
    init.tn8.rc \
    init.tn8_common.rc \
    power.ardbeg.rc \
    power.jetson-tk1.rc \
    power.loki.rc \
    power.tn8.rc

# Kernel
ifneq ($(TARGET_PREBUILT_KERNEL),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel
endif
