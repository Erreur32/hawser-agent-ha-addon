#!/usr/bin/with-contenv sh

echo "[INFO] Hawser HA add-on starting"
echo "[INFO] Dockhand URL: ${dockhand_server_url}"

if [ ! -S /var/run/docker.sock ]; then
  echo "[ERROR] Docker socket NOT found"
  ls -l /var/run || true
  exit 1
fi

echo "[INFO] Docker socket found"

exec hawser \
  --server "${dockhand_server_url}" \
  --token "${token}" \
  --log-level debug
