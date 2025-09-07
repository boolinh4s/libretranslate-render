#!/usr/bin/env python3
"""
Custom LibreTranslate configuration for Render deployment
"""

import os
from libretranslate import main

if __name__ == "__main__":
    # Set optimal configuration for Render's free tier
    os.environ.setdefault("LT_HOST", "0.0.0.0")
    os.environ.setdefault("LT_PORT", "10000")
    os.environ.setdefault("LT_THREADS", "1")
    os.environ.setdefault("LT_CHAR_LEVEL", "true")
    os.environ.setdefault("LT_UPDATE_MODELS", "true")
    os.environ.setdefault("LT_DISABLE_WEB_UI", "false")
    os.environ.setdefault("LT_API_KEYS", "false")
    os.environ.setdefault("LT_LOAD_ONLY", "en,fr,es,de,it,pt,ru,zh,ja,ko")
    os.environ.setdefault("LT_METRICS", "false")
    os.environ.setdefault("LT_DISABLE_FILES_TRANSLATION", "true")
    
    # Start LibreTranslate
    main()