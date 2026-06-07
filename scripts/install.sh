#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${AGENT_SKILLS_DIR:-$HOME/.agents/skills}"

mkdir -p "$TARGET_DIR"

install_skill() {
  local src="$1"
  local name
  name="$(basename "$src")"
  if [[ ! -f "$src/SKILL.md" ]]; then
    echo "skip $name: SKILL.md not found"
    return
  fi
  rm -rf "$TARGET_DIR/$name"
  mkdir -p "$TARGET_DIR/$name"
  rsync -a --exclude ".DS_Store" "$src/" "$TARGET_DIR/$name/"
  echo "installed $name -> $TARGET_DIR/$name"
}

for skill in "$ROOT_DIR"/skills/core/* "$ROOT_DIR"/skills/dependencies/*; do
  [[ -d "$skill" ]] || continue
  install_skill "$skill"
done

echo
echo "Skills installed to: $TARGET_DIR"
echo "Next step: add system-prompt.md to your Agent system prompt."

