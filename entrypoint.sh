apk update
apk add xvfb fluxbox x11vnc build-base libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev mesa-dev mesa-dri-gallium xvfb-run
apk add xterm
apk add virtualgl --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
git clone https://github.com/ayunami2000/noVNC
./noVNC/utils/launch.sh --listen 80 &
Xvfb -screen 0 900x720x24+32 +extension GLX &
export DISPLAY=:0
fluxbox &
x11vnc -noshm -geometry 900x720 -shared -forever &
ssh -R 80:localhost:80 nokey@localhost.run