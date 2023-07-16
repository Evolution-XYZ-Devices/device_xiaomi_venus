#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Call the MiuiCamera setup
$(call inherit-product-if-exists, vendor/xiaomi/venus-miuicamera/products/miuicamera.mk)

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina)

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Display Device Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630946736638489730.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630946736638489730.xml

# Overlays
PRODUCT_PACKAGES += \
    ApertureResVenus \
    FrameworksResVenus \
    SettingsOverlayM2011K2C \
    SettingsOverlayM2011K2G \
    SettingsProviderOverlayVenus \
    SettingsResVenus \
    SystemUIResVenus \
    WifiResVenus

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare@1.0-service.xiaomi

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.xiaomi

# Touchscreen firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/st_fts_k2.ftb:$(TARGET_COPY_OUT_VENDOR)/firmware/st_fts_k2.ftb \
    $(LOCAL_PATH)/firmware/st_fts_k2_htp.ftb:$(TARGET_COPY_OUT_VENDOR)/firmware/st_fts_k2_htp.ftb \
    $(LOCAL_PATH)/firmware/st_fts_k2.ftb:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/st_fts_k2.ftb \
    $(LOCAL_PATH)/firmware/st_fts_k2_htp.ftb:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/firmware/st_fts_k2_htp.ftb

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/venus/venus-vendor.mk)
