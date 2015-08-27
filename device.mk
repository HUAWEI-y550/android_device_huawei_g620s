#
# Copyright (C) 2015 Rudolf Tammekivi
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Use standard dalvik heap sizes
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Init
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.qcom.rc \
	init.qcom.usb.rc \
	init.target.rc \
	ueventd.qcom.rc

# Include proprietary
$(call inherit-product, vendor/huawei/g620s/g620s-vendor.mk)
