#!/bin/bash

echo "=== LibreTranslate Render Setup Verification ==="
echo ""

echo "Files in directory:"
ls -la

echo ""
echo "Dockerfile content:"
cat Dockerfile

echo ""
echo "render.yaml content:"
cat render.yaml

echo ""
echo "Checking for any references to start.sh or problematic arguments:"
grep -r "start.sh" . 2>/dev/null || echo "No start.sh references found ✓"
grep -r "char-level" . 2>/dev/null || echo "No char-level references found ✓"
grep -r "disable-files" . 2>/dev/null || echo "No disable-files references found ✓"

echo ""
echo "Setup verification complete!"