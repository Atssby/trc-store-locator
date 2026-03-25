#!/bin/bash
# Load .env
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

if [ -z "$MAPS_API_KEY" ]; then
  echo "Error: MAPS_API_KEY is not set. Create a .env file."
  exit 1
fi

sed "s/__MAPS_API_KEY__/$MAPS_API_KEY/g" index.html > index_built.html
echo "Built: index_built.html (with API key injected)"
