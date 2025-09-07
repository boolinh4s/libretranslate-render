FROM libretranslate/libretranslate:latest

# Copy the start script
COPY start.sh /start.sh

# Run the script with bash instead of making it executable
ENTRYPOINT ["bash", "/start.sh"]
