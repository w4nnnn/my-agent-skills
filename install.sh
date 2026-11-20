#!/usr/bin/env bash
# Script untuk memasang koleksi skill ke Antigravity (Global & Local)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_GLOBAL="$HOME/.gemini/config/skills"
TARGET_LOCAL="$HOME/.agents/skills"

echo "=========================================="
echo "  Memasang Koleksi My Agent Skills"
echo "=========================================="

mkdir -p "$TARGET_GLOBAL"
mkdir -p "$TARGET_LOCAL"

for skill in "$SCRIPT_DIR/skills"/*; do
  if [ -d "$skill" ]; then
    skill_name="$(basename "$skill")"
    echo "[+] Menautkan skill: $skill_name"
    ln -sfn "$skill" "$TARGET_GLOBAL/$skill_name"
    ln -sfn "$skill" "$TARGET_LOCAL/$skill_name"
  fi
done

echo ""
echo "[✓] Sukses! Seluruh skill telah ditautkan ke:"
echo "    - $TARGET_GLOBAL (Global Antigravity)"
echo "    - $TARGET_LOCAL (User Local Agents)"
echo "=========================================="
