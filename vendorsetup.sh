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
