FROM libretranslate/libretranslate:latest

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=5000

CMD ["/start.sh"]
