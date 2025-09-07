FROM libretranslate/libretranslate:latest

# Copy the patch script
COPY patch_app.py /patch_app.py

# Run the patch script
RUN python /patch_app.py

# Copy the start script
COPY start.sh /start.sh

# Run the script with bash
ENTRYPOINT ["bash", "/start.sh"]
