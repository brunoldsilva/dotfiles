#!/usr/bin/env bash

# Helper script to initialize the dotfiles in this repo.
#
# This will install Homebrew as a platform-independent package manager, Tuckr as the dotfiles
# manager, and Nushell to run the dotfiles helper.
#
# It will also install the `dotfiles` script to help manage the dotfiles.

# Enable the unofficial Bash Strict Mode.
set -euo pipefail
IFS=$'\n\t'

# Name of the script.
SCRIPT=init.sh

# Initializes the dotfiles.
function main {
    # Parse options passed to the script.
    while [[ $# -gt 0 && "$1" =~ '-' ]]; do
        case "$1" in
            '-h' | '--help')
                usage
                exit 0
                ;;
            *)
                echo "$SCRIPT: unknown option '$1'" >&2
                exit 1
                ;;
        esac
    done

    # Check for extra arguments.
    if [[ $# -gt 0 ]]; then
        echo "$SCRIPT: too many arguments (expected: 0, actual: $#)" >&2
        exit 1
    fi

    # Install the binary dependencies.
    install_deps

    # Install the dotfiles helper.
    install_helper
}

# Displays script usage information.
function usage {
    cat <<EOF
Usage: $SCRIPT [OPTIONS]

Initializes the dotfiles.

This will install Homebrew as a platform-independent package manager, Tuckr as the dotfiles
manager, and nushell to run the dotfiles helper.

OPTIONS
    -h --help   Display script usage information

EXIT CODES
    0   Success
    1   Failure

EOF
}

# Installs the binary dependencies of the dotfiles helper script.
function install_deps {
    # Install Homebrew.
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

    # Install Tuckr and Nushell.
    /home/linuxbrew/.linuxbrew/bin/brew install nushell tuckr
}

# Installs the dotfiles helper script.
function helper {
    # todo
}

# Entry point of the script.
main "$@"
