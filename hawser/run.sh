#!/usr/bin/with-contenv sh

exec hawser \
  --server "$DOCKHAND_SERVER_URL" \
  --token "$TOKEN"
