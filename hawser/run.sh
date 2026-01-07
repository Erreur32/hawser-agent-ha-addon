#!/usr/bin/with-contenv sh

echo "[INFO] Starting Hawser agent for Dockhand"
echo "[INFO] Dockhand URL: ${dockhand_server_url}"

exec hawser \
  --server "${dockhand_server_url}" \
  --token "${token}" \
  --log-level debug
