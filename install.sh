#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-auto}"
DEST="${2:-}"

usage() {
  cat <<'USAGE'
Usage:
  ./install.sh              Auto-detect platform and install.
  ./install.sh codex
  ./install.sh claude /path/to/project
  ./install.sh cursor /path/to/project
  ./install.sh openai /path/to/project
  ./install.sh dify /path/to/export/dir

Targets:
  auto    Detect the current AI platform and install the matching adapter.
  codex   Install packages as Codex skills under ~/.codex/skills.
  claude  Copy CLAUDE.md into the target project.
  cursor  Copy AGENTS.md into the target project.
  openai  Copy OpenAI adapter prompt and package references into the target project.
  dify    Export Dify tool notes and schemas into the target directory.
USAGE
}

detect_platform() {
  # Claude Code / OpenClaw: check for .claude directory or CLAUDE.md in current dir
  if [[ -n "${CLAUDE_CODE:-}" ]] || [[ -d ".claude" ]] || [[ -f "CLAUDE.md" ]]; then
    echo "claude"
    return
  fi

  # Codex: check for ~/.codex
  if [[ -d "${CODEX_SKILLS_DIR:-$HOME/.codex}" ]]; then
    echo "codex"
    return
  fi

  # Cursor: check for .cursor directory
  if [[ -d ".cursor" ]]; then
    echo "cursor"
    return
  fi

  echo ""
}

copy_dir() {
  local src="$1"
  local dst="$2"
  mkdir -p "$dst"
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --delete \
      --exclude '.git' \
      --exclude '.DS_Store' \
      "$src"/ "$dst"/
  else
    mkdir -p "$dst"
    cp -R "$src"/. "$dst"/
    echo "Warning: rsync is unavailable; copied files without cleanup excludes."
  fi
}

require_dest() {
  if [[ -z "$DEST" ]]; then
    echo "Missing destination path."
    usage
    exit 1
  fi
  mkdir -p "$DEST"
}

case "$TARGET" in
  auto)
    DETECTED=$(detect_platform)
    if [[ -z "$DETECTED" ]]; then
      echo "Cannot auto-detect the AI platform. Please specify a target explicitly:"
      usage
      exit 1
    fi
    echo "Auto-detected platform: $DETECTED"
    # Re-invoke self with detected target, forwarding DEST if provided
    DEST="${2:-}" exec bash "$0" "$DETECTED" "$DEST"
    ;;
  codex)
    CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
    copy_dir "$ROOT_DIR/packages/content-create" "$CODEX_SKILLS_DIR/lingtu-content-create"
    copy_dir "$ROOT_DIR/packages/tkshop-query" "$CODEX_SKILLS_DIR/tkshop-query"
    echo "Installed Codex skills to $CODEX_SKILLS_DIR"
    ;;
  claude)
    if [[ -z "$DEST" ]]; then
      DEST="$(pwd)"
      echo "No target path given, using current directory: $DEST"
    fi
    require_dest
    cp "$ROOT_DIR/adapters/claude/CLAUDE.md" "$DEST/CLAUDE.md"
    echo "Installed Claude adapter to $DEST/CLAUDE.md"
    ;;
  cursor)
    if [[ -z "$DEST" ]]; then
      DEST="$(pwd)"
      echo "No target path given, using current directory: $DEST"
    fi
    require_dest
    cp "$ROOT_DIR/adapters/cursor/AGENTS.md" "$DEST/AGENTS.md"
    echo "Installed Cursor adapter to $DEST/AGENTS.md"
    ;;
  openai)
    require_dest
    copy_dir "$ROOT_DIR/adapters/openai" "$DEST/lingtu-openai-adapter"
    echo "Installed OpenAI adapter to $DEST/lingtu-openai-adapter"
    ;;
  dify)
    require_dest
    copy_dir "$ROOT_DIR/adapters/dify" "$DEST/lingtu-dify-adapter"
    echo "Exported Dify adapter to $DEST/lingtu-dify-adapter"
    ;;
  ""|-h|--help|help)
    usage
    ;;
  *)
    echo "Unknown target: $TARGET"
    usage
    exit 1
    ;;
esac
