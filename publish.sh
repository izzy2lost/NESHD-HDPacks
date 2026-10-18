#!/usr/bin/env bash
# Uploads pack zips to the release and pushes the catalog.
set -euo pipefail
cd "$(dirname "$0")"
REPO=izzy2lost/NESHD-HDPacks
TAG=packs-v1

# The repo needs a commit before a release can be created.
git add hdpacks.json README.md .gitignore publish.sh
git commit -m "Update HD pack catalog" || true
git push origin main

gh release view "$TAG" --repo "$REPO" >/dev/null 2>&1 ||
  gh release create "$TAG" --repo "$REPO" --title "HD Packs" --notes "HD pack downloads for NESHD. See hdpacks.json."

# Only upload assets the release doesn't already have.
existing=$(gh release view "$TAG" --repo "$REPO" --json assets -q '.assets[].name')
for f in assets/*.zip; do
  name=$(basename "$f")
  if ! grep -qxF "$name" <<<"$existing"; then
    echo "Uploading $name"
    gh release upload "$TAG" "$f" --repo "$REPO"
  fi
done

