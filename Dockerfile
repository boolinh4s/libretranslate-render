FROM libretranslate/libretranslate:latest

# Install bash for our startup script
USER root
RUN apt-get update && apt-get install -y bash && rm -rf /var/lib/apt/lists/*

# Create startup script using cat with heredoc
RUN cat > /start.sh << 'SCRIPT_EOF'
#!/bin/bash
set -e
# Get the port from environment or default to 5000
PORT=${PORT:-5000}
echo "=== LibreTranslate Startup ==="
echo "Host: 0.0.0.0"
echo "Port: $PORT"
echo "=========================="
# Start LibreTranslate with the correct port
exec libretranslate \
  --host 0.0.0.0 \
  --port $PORT \
  --threads 4 \
  --char-limit 5000 \
  --req-limit 200 \
  --batch-limit 32
SCRIPT_EOF

# Make script executable
RUN chmod +x /start.sh

# Switch back to libretranslate user
USER libretranslate

# Expose the default port (5000)
EXPOSE 5000

CMD ["/start.sh"]
