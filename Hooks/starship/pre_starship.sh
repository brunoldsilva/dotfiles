#!/usr/bin/env bash

# Unofficial Bash Strict Mode.
set -euo pipefail; IFS=$'\n\t'

# Create a script that can be sourced by nushell to enable the prompt.
mkdir --parents "${HOME}/.config/nushell/autoload"
starship init nu > "${HOME}/.config/nushell/autoload/starship.nu"
