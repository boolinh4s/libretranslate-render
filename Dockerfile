FROM libretranslate/libretranslate:latest

EXPOSE 10000

# Use environment variables instead of command line arguments
ENV LT_HOST=0.0.0.0
ENV LT_PORT=10000