#!/usr/bin/env python3
"""
Test script for LibreTranslate deployment
"""

import requests
import json
import sys

def test_libretranslate(base_url):
    """Test LibreTranslate API endpoints"""
    
    print(f"Testing LibreTranslate at: {base_url}")
    
    # Test 1: Check if service is running
    try:
        response = requests.get(f"{base_url}/", timeout=10)
        print(f"✓ Service is running (Status: {response.status_code})")
    except Exception as e:
        print(f"✗ Service not accessible: {e}")
        return False
    
    # Test 2: Check available languages
    try:
        response = requests.get(f"{base_url}/languages", timeout=10)
        if response.status_code == 200:
            languages = response.json()
            print(f"✓ Languages endpoint working ({len(languages)} languages available)")
            print(f"  Available languages: {[lang['code'] for lang in languages[:5]]}...")
        else:
            print(f"✗ Languages endpoint failed (Status: {response.status_code})")
            return False
    except Exception as e:
        print(f"✗ Languages endpoint error: {e}")
        return False
    
    # Test 3: Test translation
    try:
        test_data = {
            "q": "Hello world",
            "source": "en",
            "target": "fr",
            "format": "text"
        }
        
        response = requests.post(
            f"{base_url}/translate",
            json=test_data,
            headers={"Content-Type": "application/json"},
            timeout=30
        )
        
        if response.status_code == 200:
            result = response.json()
            translated_text = result.get("translatedText", "")
            print(f"✓ Translation working: '{test_data['q']}' → '{translated_text}'")
        else:
            print(f"✗ Translation failed (Status: {response.status_code})")
            print(f"  Response: {response.text}")
            return False
    except Exception as e:
        print(f"✗ Translation error: {e}")
        return False
    
    print("✓ All tests passed!")
    return True

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python test.py <base_url>")
        print("Example: python test.py https://your-app.onrender.com")
        sys.exit(1)
    
    base_url = sys.argv[1].rstrip('/')
    success = test_libretranslate(base_url)
    sys.exit(0 if success else 1)