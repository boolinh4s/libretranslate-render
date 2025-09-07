FROM libretranslate/libretranslate:full

# Copy the start script
COPY start.sh /start.sh

# Run the script with bash
ENTRYPOINT ["bash", "/start.sh"]
