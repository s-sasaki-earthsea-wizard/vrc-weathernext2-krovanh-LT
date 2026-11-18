#!/usr/bin/env bash
# Subset the heading and body fonts to the characters the deck uses.
#
# The source TTFs come from google/fonts at a pinned commit. Both families
# are licensed under the SIL Open Font License 1.1 and declare no Reserved
# Font Name, so a subset may keep the family name; the license text is copied
# next to the subsets. The TTFs are cached under .cache/fonts/ (git-ignored);
# only the subsets in slides-jp/vendor/fonts/ are committed.
#
# Re-run after editing slides-jp/index.html so that new characters are
# covered. A character missing from a subset falls back to the next font in
# the CSS stack (Hiragino on macOS), so a stale subset degrades, not breaks.
set -euo pipefail

cd "$(dirname "$0")/.."

GOOGLE_FONTS_SHA="75706cfdd7c49a2be20f66c1e24c26f4f39a33b8"
FONTTOOLS="fonttools[woff]==4.68.0"
SRC_DIR=".cache/fonts"
OUT_DIR="slides-jp/vendor/fonts"
TEXT_FILE="slides-jp/index.html"

# Printable ASCII, Latin-1, general punctuation, arrows, math operators,
# CJK symbols, kana and full-width forms: small edits stay in the font.
UNICODES="U+0020-007E,U+00A0-00FF,U+2010-2027,U+2190-21FF,U+2200-22FF,U+3000-30FF,U+FF00-FFEF"

FONTS=(
  "ofl/shipporiminchob1/ShipporiMinchoB1-Bold.ttf"
  "ofl/shipporiminchob1/ShipporiMinchoB1-ExtraBold.ttf"
  "ofl/zenmarugothic/ZenMaruGothic-Medium.ttf"
  "ofl/zenmarugothic/ZenMaruGothic-Bold.ttf"
)
LICENSES=(
  "ofl/shipporiminchob1/OFL.txt:OFL-ShipporiMinchoB1.txt"
  "ofl/zenmarugothic/OFL.txt:OFL-ZenMaruGothic.txt"
)

fetch() {
  local path="$1" dest="$2"
  if [[ ! -f "$dest" ]]; then
    echo "fetch $path"
    curl -fsSL -o "$dest.part" \
      "https://raw.githubusercontent.com/google/fonts/${GOOGLE_FONTS_SHA}/${path}"
    mv "$dest.part" "$dest"
  fi
}

mkdir -p "$SRC_DIR" "$OUT_DIR"

for path in "${FONTS[@]}"; do
  name="$(basename "$path" .ttf)"
  fetch "$path" "$SRC_DIR/$name.ttf"
  uvx --from "$FONTTOOLS" pyftsubset "$SRC_DIR/$name.ttf" \
    --text-file="$TEXT_FILE" \
    --unicodes="$UNICODES" \
    --layout-features='*' \
    --flavor=woff2 \
    --output-file="$OUT_DIR/$name.woff2"
  echo "wrote $OUT_DIR/$name.woff2 ($(wc -c < "$OUT_DIR/$name.woff2") bytes)"
done

for entry in "${LICENSES[@]}"; do
  fetch "${entry%%:*}" "$OUT_DIR/${entry##*:}"
done
