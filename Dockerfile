FROM libretranslate/libretranslate:latest

# Explicitly start LibreTranslate with Render's PORT
CMD ltserver --host 0.0.0.0 --port $PORT

