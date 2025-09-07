FROM libretranslate/libretranslate:latest

# Patch the app.py file to avoid importing argostranslatefiles
RUN sed -i '/import argostranslatefiles/d' /app/libretranslate/app.py

# Copy the start script
COPY start.sh /start.sh

# Run the script with bash
ENTRYPOINT ["bash", "/start.sh"]
