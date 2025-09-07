FROM libretranslate/libretranslate:latest

# Expose the port that LibreTranslate runs on
EXPOSE 5000

# Start LibreTranslate with explicit arguments
CMD ["sh", "-c", "libretranslate --host 0.0.0.0 --port ${PORT:-5000} --threads 4 --char-limit 5000 --req-limit 200 --batch-limit 32"]