FROM libretranslate/libretranslate:latest

# Set environment variables for Render
ENV LT_DISABLE_WEB_UI=false
ENV LT_API_KEYS=false
ENV LT_LOAD_ONLY=en,fr,es,de,it,pt,ru,zh,ja,ko
ENV LT_HOST=0.0.0.0
ENV LT_PORT=10000

# Expose the port that Render expects
EXPOSE 10000

# Start LibreTranslate with optimized settings for Render
CMD ["libretranslate", "--host", "0.0.0.0", "--port", "10000", "--char-level", "--update-models"]