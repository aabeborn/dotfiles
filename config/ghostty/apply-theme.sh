
#!/usr/bin/env bash
set -e

export HOME="/Users/$(whoami)"

CONFIG_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_CONFIG="$CONFIG_DIR/config"
THEMES_DIR="$CONFIG_DIR/themes"

# Detect dark mode
is_dark() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]
  else
    hour=$(date +%H)
    (( hour >= 19 || hour < 7 ))
  fi
}

if is_dark; then
  THEME_FILE="$THEMES_DIR/rose-pine-moon.conf"
else
  THEME_FILE="$THEMES_DIR/rose-pine-dawn.conf"
fi

# Rewrite config (Ghostty auto-reloads)
sed '/^theme = /d' "$BASE_CONFIG" > "$BASE_CONFIG.tmp"
cat "$THEME_FILE" >> "$BASE_CONFIG.tmp"
mv "$BASE_CONFIG.tmp" "$BASE_CONFIG"

echo "👻 Ghostty theme applied: $(basename "$THEME_FILE" .conf)"
