#!/bin/bash

function apply_patch() {
    if patch -d "$1" -p1 --dry-run <<<"$(curl -sL "$2")" >/dev/null; then
        patch -d "$1" -p1 <<<"$(curl -sL "$2")"
    else
        echo -e "\nERROR: Failed to patch the '$1' directory...\n"
    fi
}

# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
apply_patch "frameworks/av" "https://github.com/ArrowOS/android_frameworks_av/commit/1fb1c48309cf01deb9e3f8253cb7fa5961c25595.patch"

# BrightnessUtils: Fix the brightness slider curve for some devices
apply_patch "frameworks/base" "https://github.com/realme-mt6785-devs/android_frameworks_base/commit/7d626a51c37bf40dcceeae0c52afc4b5fbf5203a.patch"

# Biometrics: Allow the disabling of fingerprint cleanups
apply_patch "frameworks/base" "https://github.com/AOSP-XIII/frameworks_base/commit/ada64b488725c66f948221a3b9403f2b5f040a43.patch"

# AuthService: Add support for workaround side fps props
apply_patch "frameworks/base" "https://github.com/AOSP-XIII/frameworks_base/commit/cc8546c540f742c62e470129abb1eb040948dc1d.patch"

# gd: hci: Ignore unexpected status events
apply_patch "packages/modules/Bluetooth" "https://github.com/LineageOS/android_packages_modules_Bluetooth/commit/e7f12ea3dbf6dc632f38ecb75a406c64e90a3f34.patch"

# drivers: mediatek: c2k_usb: Fix the implicit truncation of some of the values
apply_patch "kernel/realme/mt6785" "https://github.com/prathamdubey2005/kernel_realme_mt6785/commit/989e91dd8a9799b22915dbd62048733ea351355d.patch"
