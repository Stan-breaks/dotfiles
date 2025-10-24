#!/usr/bin/env bash
set -u pipefail

# Configuration
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
TMPDIR=""
applications="$HOME/.local/share/applications/wallpaper/"

# Create a temporary desktop entry for each wallpaper
create_entries() {

  mkdir -p "$TMPDIR/applications"
  mkdir -p "$applications"

  [ ! -L "$applications" ] && ln -sf "$TMPDIR/applications/" "$applications"

  local file
  for file in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp}; do
    [[ -e "$file" ]] || continue
    local name

    name=$(basename "$file")
    local desktop_file="$TMPDIR/applications/wallpaper-${name%.*}.desktop"


    cat >"$desktop_file" <<EOF
[Desktop Entry]
Name=${name%.*}
Exec=echo $file
Icon=$file
Type=Application
Categories=wallpaper;
EOF
  done
}

# Launch rofi and pick one
pick_wallpaper() {
  rofi_out=$(rofi -show drun -drun-categories wallpaper -filter "" -show-icons)
  rm -rf "$TMPDIR/applications"
  echo "$rofi_out"
}

setup_cleanup() {
  TMPDIR=$(mktemp -d 2>/dev/null)
  trap 'rm -rf "$TMPDIR"' EXIT
}

main() {
  setup_cleanup
  create_entries
  wallpaper=$(pick_wallpaper)
  pkill -x swaybg ; swaybg -i $wallpaper -m fill &
}

main "$@"

