FROM libretranslate/libretranslate:latest

# Copy the start script
COPY start.sh /start.sh

# Make the script executable
RUN chmod +x /start.sh

# Set the entrypoint to the start script
ENTRYPOINT ["/start.sh"]
