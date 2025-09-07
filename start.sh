#!/bin/bash
# Start script for LibreTranslate on Render
echo "Starting LibreTranslate on Render..."
echo "Render's PORT environment variable: $PORT"
# Check LibreTranslate version and available arguments
echo "LibreTranslate version:"
ltserver --help | head -5
# Set environment variables
export LT_HOST=0.0.0.0
export LT_PORT=${PORT:-10000}
echo "LT_PORT set to: $LT_PORT"
export LT_THREADS=1
export LT_UPDATE_MODELS=true
export LT_DISABLE_WEB_UI=false
export LT_API_KEYS=false
export LT_LOAD_ONLY=en,fr,es,de,it,pt,ru,zh,ja,ko
export LT_METRICS=false
export LT_DISABLE_FILES_TRANSLATION=true
echo "Starting LibreTranslate with arguments:"
echo "Host: $LT_HOST, Port: $LT_PORT, Threads: $LT_THREADS"
# Start LibreTranslate with minimal arguments first
echo "Executing: ltserver --host $LT_HOST --port $LT_PORT"
exec ltserver --host $LT_HOST --port $LT_PORT
