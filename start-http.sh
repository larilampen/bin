#!/bin/bash

# Start a local http server. Uses either thin or Python's simple HTTP server.

PORT=3000

if hash thin 2>/dev/null; then
  thin start -p $PORT
else
  python -m SimpleHTTPServer $PORT
fi
