#!/usr/bin/env bash
rm -rf ./pkg ./src ./dwm-**
makepkg -sif --skipinteg --noconfirm
sudo install -m644 -D ./sleeplock.service /etc/systemd/system/sleeplock.service
sudo install -m755 -D ./lock.sh $HOME/.local/bin/lock
