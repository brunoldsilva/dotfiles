#!/usr/bin/env bash

# Unofficial Bash Strict Mode.
set -euo pipefail; IFS=$'\n\t'

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/Configs/dotfiles"
DESTINATION="$HOME"

# Create the parent folders before creating the symlink.
find "$SOURCE" -mindepth 1 -type d -printf '%P\0' | xargs -0 -I{} mkdir -p "$DESTINATION/{}"
