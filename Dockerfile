FROM libretranslate/libretranslate:latest

# Install the missing dependency
RUN pip install argostranslatefiles

# Copy the start script
COPY start.sh /start.sh

# Run the script with bash
ENTRYPOINT ["bash", "/start.sh"]
