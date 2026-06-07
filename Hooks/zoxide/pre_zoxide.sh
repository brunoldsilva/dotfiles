#!/usr/bin/env bash

# Unofficial Bash Strict Mode.
set -euo pipefail; IFS=$'\n\t'

# Create a script that can be sourced by nushell to enable the prompt.
mkdir --parents "${HOME}/.config/nushell/autoload"
zoxide init --cmd cd nushell > "${HOME}/.config/nushell/autoload/zoxide.nu"
