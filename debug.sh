#!/bin/bash

echo "=== LibreTranslate Debug Information ==="
echo "Checking LibreTranslate installation..."

# Check if libretranslate command exists
which libretranslate

echo ""
echo "LibreTranslate help output:"
libretranslate --help

echo ""
echo "LibreTranslate version:"
libretranslate --version 2>/dev/null || echo "Version command not available"

echo ""
echo "Python version:"
python --version

echo ""
echo "Available Python modules:"
python -c "import libretranslate; print('LibreTranslate module found')" 2>/dev/null || echo "LibreTranslate module not found"