#
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
#

COMMON_PATH := device/samsung/smdk4412-qcom-common

# GPS
PRODUCT_PACKAGES += \
    gps.default \
    libgps.utils \
    libloc_core \
    libloc_eng

PRODUCT_PROPERTY_OVERRIDES += \
    ro.gps.agps_provider=1 \
    ro.qc.sdk.izat.premium_enabled=0 \
    ro.qc.sdk.izat.service_mask=0x0 \
    persist.gps.qc_nlp_in_use=0

ifeq ($(TARGET_VOICE_TECH), cdma)
    GPS_CONF := $(COMMON_PATH)/gps/etc/gps-cdma.conf
else
    GPS_CONF := $(COMMON_PATH)/gps/etc/gps.conf
endif

PRODUCT_COPY_FILES += \
    $(GPS_CONF):/system/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:/system/etc/sap.conf

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=smdk4x12QComRIL

