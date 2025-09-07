#!/usr/bin/env python3
"""
Simple test script to verify LibreTranslate deployment
"""
import requests
import sys
import time

def test_libretranslate(base_url):
    """Test LibreTranslate endpoints"""
    print(f"Testing LibreTranslate at: {base_url}")
    
    # Test 1: Health check
    try:
        response = requests.get(f"{base_url}/", timeout=10)
        print(f"✓ Health check: {response.status_code}")
    except Exception as e:
        print(f"✗ Health check failed: {e}")
        return False
    
    # Test 2: Languages endpoint
    try:
        response = requests.get(f"{base_url}/languages", timeout=10)
        if response.status_code == 200:
            languages = response.json()
            print(f"✓ Languages endpoint: {len(languages)} languages available")
        else:
            print(f"✗ Languages endpoint failed: {response.status_code}")
    except Exception as e:
        print(f"✗ Languages endpoint failed: {e}")
    
    # Test 3: Translation
    try:
        data = {
            "q": "Hello world",
            "source": "en",
            "target": "es"
        }
        response = requests.post(f"{base_url}/translate", json=data, timeout=30)
        if response.status_code == 200:
            result = response.json()
            print(f"✓ Translation test: '{data['q']}' -> '{result.get('translatedText', 'N/A')}'")
        else:
            print(f"✗ Translation failed: {response.status_code}")
    except Exception as e:
        print(f"✗ Translation failed: {e}")
    
    return True

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python test-deployment.py <base_url>")
        print("Example: python test-deployment.py https://your-service.onrender.com")
        sys.exit(1)
    
    base_url = sys.argv[1].rstrip('/')
    test_libretranslate(base_url)