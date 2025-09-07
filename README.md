# LibreTranslate on Render.com

This repository contains the configuration to deploy LibreTranslate on Render.com.

## What is LibreTranslate?

LibreTranslate is a free and open source machine translation API, entirely self-hosted. It provides translation services without relying on proprietary providers.

## Deployment

### Option 1: Deploy via Render Dashboard

1. Fork this repository to your GitHub account
2. Connect your GitHub account to Render.com
3. Create a new Web Service on Render
4. Connect your forked repository
5. Render will automatically detect the `render.yaml` file and deploy

### Option 2: Deploy via Blueprint

1. Click the "Deploy to Render" button below
2. Connect your GitHub account if prompted
3. The service will be deployed automatically

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

## Configuration

The service is configured with the following default settings:

- **Port**: 5000
- **Character limit**: 5000 characters per request
- **Request limit**: 200 requests per minute
- **Batch limit**: 32 texts per batch request
- **API Keys**: Disabled (public access)
- **Web UI**: Enabled
- **Threads**: 4

### Environment Variables

You can customize the deployment by modifying the environment variables in `render.yaml`:

- `LT_CHAR_LIMIT`: Maximum characters per translation request
- `LT_REQ_LIMIT`: Maximum requests per minute per IP
- `LT_BATCH_LIMIT`: Maximum number of texts in a batch request
- `LT_API_KEYS`: Set to `true` to require API keys
- `LT_DISABLE_WEB_UI`: Set to `true` to disable the web interface
- `LT_LOAD_ONLY`: Comma-separated list of language codes to load only specific models

## Usage

Once deployed, your LibreTranslate instance will be available at your Render service URL.

### API Example

```bash
curl -X POST "https://your-service-name.onrender.com/translate" \
     -H "Content-Type: application/json" \
     -d '{
       "q": "Hello, world!",
       "source": "en",
       "target": "es"
     }'
```

### Web Interface

Visit your service URL in a browser to access the web interface for translations.

## Supported Languages

LibreTranslate supports many language pairs. You can get the list of supported languages by making a GET request to `/languages`.

## Cost Considerations

- Render's free tier includes 750 hours per month
- LibreTranslate can be resource-intensive, especially with multiple language models
- Consider upgrading to a paid plan for production use
- Monitor your usage to avoid unexpected charges

## Testing Your Deployment

Once deployed, you can test your LibreTranslate instance:

```bash
# Test the deployment
python test-deployment.py https://your-service-name.onrender.com
```

## Troubleshooting

### Common Issues:

1. **"No open ports detected"**
   - This usually means the service isn't binding to the correct port
   - Check the logs for "LibreTranslate Startup" messages
   - Ensure the PORT environment variable is being used correctly

2. **Service takes long to start**
   - Initial startup takes 3-5 minutes as language models download
   - Check logs for download progress
   - Consider upgrading to a paid plan for faster startup

3. **Health check failures**
   - The `/languages` endpoint may take time to respond initially
   - Wait for model loading to complete
   - Check service logs for errors

4. **Memory issues**
   - LibreTranslate requires significant memory for language models
   - Free tier may not be sufficient for all language pairs
   - Consider upgrading to Starter plan or higher

### Debugging Steps:

1. Check Render service logs for startup messages
2. Verify the service is listening on the correct port
3. Test endpoints manually once the service is running
4. Monitor memory usage in Render dashboard