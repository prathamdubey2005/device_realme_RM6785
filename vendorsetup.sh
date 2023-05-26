#!/bin/bash

function apply_patch() {
    if patch -d "$1" -p1 --dry-run <<<"$(curl -sL "$2")" >/dev/null; then
        patch -d "$1" -p1 <<<"$(curl -sL "$2")"
    else
        echo -e "\nERROR: Failed to patch the '$1' directory...\n"
    fi
}
