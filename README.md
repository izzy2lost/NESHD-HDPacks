# NESHD HD Packs

Downloadable Mesen HD packs for the [NESHD](https://github.com/izzy2lost/NESHD) Android app.

The pack zips are attached to the [`packs-v1` release](https://github.com/izzy2lost/NESHD-HDPacks/releases/tag/packs-v1).
`hdpacks.json` is the catalog the app reads: each entry has the download URL, size,
SHA-256, and the ROM SHA-1s from the pack's `<supportedRom>` lines.

In the app: long-press a game → **Download HD Pack**.

All HD packs are the work of their original authors and are redistributed here for convenience.

## Adding or updating packs

```sh
# 1. Drop zips into ~/Desktop/NES_HD_PACKS, then rebuild the catalog (keeps hand-edited titles/aliases):
python3 ../NESHD/Android/tools/build_hdpack_catalog.py ~/Desktop/NES_HD_PACKS .
# 2. Edit titles/aliases/notes in hdpacks.json for any new entries.
# 3. Publish:
./publish.sh
```
