#!/bin/ash
apk update
apk add xvfb fluxbox x11vnc build-base libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev mesa-dev mesa-dri-gallium xvfb-run xterm git python2 bash unzip #nodejs npm
apk add virtualgl --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb -screen 0 900x720x24+32 +extension GLX &
export DISPLAY=:0
fluxbox &
x11vnc -noshm -geometry 900x720 -shared -forever &
#npm i localtunnel
#node node_modules/localtunnel/bin/lt.js --port 80
unzip ./localtunnel_linux-x64.zip
chmod +x ./linux-x64/Localtunnel
./linux-x64/Localtunnel --port 80 http
