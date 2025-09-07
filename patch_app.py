#!/usr/bin/env python3
import re

# Read the original app.py file
with open('/app/libretranslate/app.py', 'r') as f:
    content = f.read()

# Replace the problematic import with a conditional import
# This will only import argostranslatefiles if file translation is enabled
replacement = """# Conditional import for argostranslatefiles
import os
if os.environ.get('LT_DISABLE_FILES_TRANSLATION', 'false').lower() != 'true':
    from argostranslatefiles import get_supported_formats
else:
    # Mock function when file translation is disabled
    def get_supported_formats():
        return []"""

# Replace the import statement
content = re.sub(
    r'from argostranslatefiles import get_supported_formats',
    replacement,
    content
)

# Write the patched content back
with open('/app/libretranslate/app.py', 'w') as f:
    f.write(content)

print("Patched app.py successfully")
