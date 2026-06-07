#!/usr/bin/env bash

# Unofficial Bash Strict Mode.
set -euo pipefail; IFS=$'\n\t'

# Create a script that can be sourced by nushell to enable completions.
mkdir --parents "${HOME}/.config/nushell/autoload"
carapace _carapace nushell > "${HOME}/.config/nushell/autoload/carapace.nu"
