#!/bin/sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)"
SITE_ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
CONTENT_ROOT="$SITE_ROOT/content"
VALIDATOR="$ROOT/scripts/validate-figure-links.py"

if [ ! -f "$VALIDATOR" ]; then
  echo "Missing validator: $VALIDATOR" >&2
  exit 1
fi

TARGETS=$(find "$CONTENT_ROOT" -type d -mindepth 2 -maxdepth 2)

if [ -z "$TARGETS" ]; then
  echo "No article directories found under $CONTENT_ROOT"
  exit 0
fi

python3 "$VALIDATOR" $TARGETS

echo "Prepublish check passed."
