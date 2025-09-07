#!/usr/bin/env bash
PORT=${PORT:-5000}
exec libretranslate --host 0.0.0.0 --port "$PORT"
