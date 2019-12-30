#!/usr/bin/env bash
sudo install -m755 -D ./wallpaper.jpg /var/wallpaper.jpg
sudo install -m755 -D ./lock.png /var/lock.png
feh --bg-scale /var/wallpaper.jpg
wal -i /var/background.jpg

rm -rf ./pkg ./src ./dwm-**
makepkg -sif --skipinteg --noconfirm
sudo install -m644 -D ./sleeplock.service /etc/systemd/system/sleeplock.service
sudo install -m755 -D ./lock.sh $HOME/.local/bin/lock
sudo install -m755 -D ./status.sh $HOME/.local/bin/status_bar
sudo install -m755 -D ./.xinitrc $HOME/.xinitrc
