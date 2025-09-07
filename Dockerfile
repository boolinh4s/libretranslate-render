FROM libretranslate/libretranslate:latest

# Use Render's PORT environment variable, defaulting to 10000 if not set
ENV LT_PORT=${PORT:-10000}
ENV LT_HOST=0.0.0.0

# Expose the port that will be used
EXPOSE $PORT
