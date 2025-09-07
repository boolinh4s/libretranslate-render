FROM libretranslate/libretranslate:latest

# Install curl for health checks
USER root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Create app directory and set permissions
RUN mkdir -p /app/db && chown -R libretranslate:libretranslate /app

# Copy startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh && chown libretranslate:libretranslate /app/start.sh

# Switch to libretranslate user
USER libretranslate
WORKDIR /app

# Set environment variables for Render
ENV LT_DISABLE_WEB_UI=false
ENV LT_API_KEYS=false
ENV LT_LOAD_ONLY=en,fr,es,de,it,pt,ru,zh,ja,ko
ENV LT_HOST=0.0.0.0
ENV LT_PORT=10000
ENV LT_THREADS=1
ENV LT_CHAR_LEVEL=true
ENV LT_UPDATE_MODELS=true
ENV LT_METRICS=false
ENV LT_DISABLE_FILES_TRANSLATION=true

# Expose the port that Render expects
EXPOSE 10000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=120s --retries=3 \
  CMD curl -f http://localhost:10000/languages || exit 1

# Start LibreTranslate with optimized settings for Render
CMD ["/app/start.sh"]