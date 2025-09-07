#!/bin/bash
# Start script for LibreTranslate on Render
echo "Starting LibreTranslate on Render..."
echo "Render's PORT environment variable: $PORT"

# Set environment variables
export LT_HOST=0.0.0.0
export LT_PORT=${PORT:-10000}
export LT_THREADS=1
export LT_UPDATE_MODELS=true
export LT_DISABLE_WEB_UI=false
export LT_API_KEYS=false
export LT_LOAD_ONLY=en,fr,es,de,it,pt,ru,zh,ja,ko
export LT_METRICS=false
export LT_DISABLE_FILES_TRANSLATION=true

echo "Starting LibreTranslate with:"
echo "Host: $LT_HOST, Port: $LT_PORT, Threads: $LT_THREADS"

# Start LibreTranslate (it will automatically use the environment variables)
echo "Executing: python -m libretranslate"
exec python -m libretranslate
