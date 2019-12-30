#!/usr/bin/env bash
rm -rf ./pkg ./src ./dwm-**
makepkg -sif --skipinteg --noconfirm
