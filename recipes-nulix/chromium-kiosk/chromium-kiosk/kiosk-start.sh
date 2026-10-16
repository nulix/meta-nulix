#!/bin/sh

# 1. Clean up potential dirty shutdown markers from sudden power-cuts
if [ -f /root/.config/chromium/Default/Preferences ]; then
  sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /root/.config/chromium/Default/Preferences 2>/dev/null
fi

# 2. Launch Chromium in the foreground (Systemd tracks this process)
exec chromium \
    --kiosk \
    --app=http://127.0.0.1 \
    --no-first-run \
    --disable-infobars \
    --ozone-platform=wayland \
    --no-sandbox \
    --disable-gpu \
    --log-level=3

