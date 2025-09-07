FROM libretranslate/libretranslate:latest

COPY start.sh /start.sh

CMD ["sh", "/start.sh"]
