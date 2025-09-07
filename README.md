# LibreTranslate on Render

This repository contains the configuration to deploy LibreTranslate on Render.com.

## Features

- Free hosting on Render.com
- Pre-loaded with common languages (English, French, Spanish, German, Italian, Portuguese, Russian, Chinese, Japanese, Korean)
- Web UI enabled for testing
- Optimized for Render's free tier

## Deployment

1. Push this repository to GitHub
2. Connect it to Render.com
3. Deploy as a Web Service using Docker

## Usage

Once deployed, you can use the LibreTranslate API at your Render URL:

```bash
curl -X POST https://your-app-name.onrender.com/translate \
  -H "Content-Type: application/json" \
  -d '{"q":"Hello world","source":"en","target":"fr","format":"text"}'
```

## Environment Variables

- `LT_DISABLE_WEB_UI`: Set to "false" to enable web interface
- `LT_API_KEYS`: Set to "false" for no API key requirement
- `LT_LOAD_ONLY`: Comma-separated list of language codes to load
- `LT_HOST`: Host to bind to (0.0.0.0 for Render)
- `LT_PORT`: Port to bind to (10000 for Render)