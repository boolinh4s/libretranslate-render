# LibreTranslate on Render

This repository contains the configuration to deploy LibreTranslate on Render.com's free tier.

## Features

- ✅ Free hosting on Render.com
- ✅ Pre-loaded with 10 common languages (en, fr, es, de, it, pt, ru, zh, ja, ko)
- ✅ Web UI enabled for testing
- ✅ Optimized for Render's free tier (512MB RAM)
- ✅ Health checks and monitoring
- ✅ CORS enabled for web applications

## Quick Deploy to Render

1. **Fork this repository** to your GitHub account
2. **Go to Render.com** and create a new Web Service
3. **Connect your GitHub** repository
4. **Use these settings:**
   - Environment: `Docker`
   - Plan: `Free`
   - Auto-Deploy: `Yes`
5. **Deploy!** (Takes 10-15 minutes for first deployment)

## Manual Deployment Steps

### 1. Create GitHub Repository
```bash
git clone <this-repo>
cd libretranslate-render
git remote set-url origin https://github.com/YOUR_USERNAME/libretranslate-render.git
git push -u origin main
```

### 2. Deploy on Render
- Go to https://dashboard.render.com/
- Click "New +" → "Web Service"
- Connect your GitHub repository
- Configure:
  - **Name:** `libretranslate`
  - **Environment:** `Docker`
  - **Plan:** `Free`
  - **Auto-Deploy:** `Yes`

### 3. Wait for Deployment
- First deployment takes 10-15 minutes
- Models are downloaded and cached
- Monitor logs for "Running on http://0.0.0.0:10000"

## Usage

### Web Interface
Visit your Render URL: `https://your-app-name.onrender.com`

### API Usage
```bash
# Test translation
curl -X POST https://your-app-name.onrender.com/translate \
  -H "Content-Type: application/json" \
  -d '{"q":"Hello world","source":"en","target":"fr","format":"text"}'

# Get available languages
curl https://your-app-name.onrender.com/languages
```

### JavaScript/React Usage
```javascript
const translateText = async (text, from, to) => {
  const response = await fetch('https://your-app-name.onrender.com/translate', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      q: text,
      source: from,
      target: to,
      format: 'text'
    })
  });
  
  const result = await response.json();
  return result.translatedText;
};
```

## Testing Your Deployment

Use the included test script:
```bash
python test.py https://your-app-name.onrender.com
```

## Configuration

### Supported Languages
- English (en)
- French (fr)
- Spanish (es)
- German (de)
- Italian (it)
- Portuguese (pt)
- Russian (ru)
- Chinese (zh)
- Japanese (ja)
- Korean (ko)

### Environment Variables
| Variable | Default | Description |
|----------|---------|-------------|
| `LT_HOST` | `0.0.0.0` | Host to bind to |
| `LT_PORT` | `10000` | Port to bind to (Render requirement) |
| `LT_THREADS` | `1` | Number of threads (optimized for free tier) |
| `LT_CHAR_LEVEL` | `true` | Enable character-level translation |
| `LT_UPDATE_MODELS` | `true` | Auto-update models |
| `LT_DISABLE_WEB_UI` | `false` | Enable web interface |
| `LT_API_KEYS` | `false` | Disable API key requirement |
| `LT_LOAD_ONLY` | `en,fr,es,de,it,pt,ru,zh,ja,ko` | Languages to load |
| `LT_METRICS` | `false` | Disable metrics (saves memory) |
| `LT_DISABLE_FILES_TRANSLATION` | `true` | Disable file uploads (saves memory) |

## Render Free Tier Limitations

- **Memory:** 512MB RAM
- **Sleep:** Service sleeps after 15 minutes of inactivity
- **Cold Start:** First request after sleep takes 30-60 seconds
- **Monthly Hours:** 750 hours per month
- **Build Time:** 10-15 minutes for first deployment

## Troubleshooting

### Deployment Issues
- Ensure repository is public
- Check Render build logs for errors
- Verify Dockerfile syntax

### Memory Issues
- Reduce languages in `LT_LOAD_ONLY`
- Set `LT_THREADS=1`
- Keep `LT_METRICS=false`

### Slow Response
- First request after sleep is always slow (cold start)
- Consider upgrading to paid plan for always-on service

### Connection Issues
- Check if service is sleeping
- Verify CORS headers for web requests
- Test with curl first

## Support

- LibreTranslate Documentation: https://github.com/LibreTranslate/LibreTranslate
- Render Documentation: https://render.com/docs
- Issues: Create an issue in this repository