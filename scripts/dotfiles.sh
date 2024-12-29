#!/usr/bin/env bash

# Helper script for system configuration.

# Unofficial bash strict mode.
set -euo pipefail
IFS=$'\n\t'

# Name of the script.
SCRIPT="dotfiles.sh"

# Entry point for the script.
function main() {
    # Parse script options.
    while [[ $# -gt 0 && "$1" =~ '-' ]]; do
        case "$1" in
        -h | --help)
            usage dotfiles
            exit 0
            ;;
        --)
            shift 1
            break
            ;;
        *)
            echo -e "$SCRIPT: unknown option '$1'"
            exit 1
            ;;
        esac
    done

    # Parse script arguments.
    if [[ $# -gt 0 ]]; then
        case $1 in
        init)
            shift 1
            init "$@"
            ;;
        list)
            shift 1
            list "$@"
            ;;
        help)
            shift 1
            usage "$@"
            ;;
        *)
            echo -e "$SCRIPT: unknown command '$1'"
            exit 1
            ;;
        esac
    else
        echo -e "$SCRIPT: missing command"
        exit 1
    fi
}

# Installs cargo and Tuckr.
function init() {
    # Parse command options.
    while [[ $# -gt 0 && "$1" =~ '-' ]]; do
        case "$1" in
        -h | --help)
            usage init
            exit 0
            ;;
        --)
            shift 1
            break
            ;;
        *)
            echo -e "$SCRIPT: unknown option '$1'"
            exit 1
            ;;
        esac
    done

    # Prompt the user before installing anything. Default answer is yes.
    read -r -i 'Y' -p "$SCRIPT: This will install cargo and Tuckr. Do you wish to proceed? [Y/n] "
    REPLY="${REPLY:-Y}"

    # Check the users reply.
    if [[ $REPLY != 'Y' && $REPLY != 'y' ]]; then
        echo -e "$SCRIPT: aborting"
        exit 1
    fi

    # Install cargo using the rustup toolchain manager.
    if ! command -v cargo &>/dev/null; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        # shellcheck disable=SC1091
        source "$HOME/.cargo/env"
    else
        echo -e "$SCRIPT: cargo already installed"
    fi

    # Install Tuckr using cargo.
    if ! command -v tuckr &>/dev/null; then
        cargo install --locked --git https://github.com/RaphGL/Tuckr.git tuckr
    else
        echo -e "$SCRIPT: Tuckr already installed"
    fi
}

# Lists tools by category.
function list() {
    # Parse command options.
    while [[ $# -gt 0 && "$1" =~ '-' ]]; do
        case "$1" in
        -h | --help)
            usage list
            exit 0
            ;;
        --)
            shift 1
            break
            ;;
        *)
            echo -e "$SCRIPT: unknown option '$1'"
            exit 1
            ;;
        esac
    done

    # Sanity check.
    if [[ $# -eq 0 ]]; then
        echo -e "$SCRIPT: missing arguments"
        exit 1
    fi

    # Terminal shells.
    declare -a shells=(
        zsh     # Customizable command shell for UNIX-like environments
        nushell # A new type of shell.
    )

    # Command Line Interface tools.
    declare -a cli=(
        starship # Minimal, blazing-fast, and infinitely customizable prompt for any shell.
        zoxide   # Smarter cd command, inspired by z and autojump.
        ripgrep  # Modern alternative to `grep`.
        fd-find  # Simple, fast and user-friendly alternative to 'find'.
        ouch     # Painless compression and decompression in the terminal.
        tealdeer # Very fast implementation of `tldr` in Rust.
        eza      # Modern alternative to ls.
    )

    # Display lists.
    while [[ $# -gt 0 ]]; do
        case "$1" in
        all)
            echo -n "${shells[@]}"
            echo -n "${cli[@]}"
            break
            ;;
        shells)
            echo -n "${shells[@]}"
            shift 1
            ;;
        cli)
            echo -n "${cli[@]}"
            shift 1
            ;;
        *)
            echo -e "$SCRIPT: unknown list $1"
            exit 1
            ;;
        esac
        echo -n " "
    done
    echo
}

# Displays a help message for using this script.
function usage() {
    # Sanity check.
    if [[ $# -eq 0 ]]; then
        echo -e "$SCRIPT: missing arguments"
        exit 1
    fi

    # Display specific help messages.
    case "$1" in
    dotfiles)
        cat <<EOF
Helper script for system configuration.

USAGE:

$SCRIPT [OPTIONS...] COMMAND [ARGS...]

COMMANDS:

init    Install \`cargo\` and \`Tuckr\`.
list    List tools by category.
help    Display a help message for a given command.

OPTIONS:

-h --help   Display this message.
EOF
        ;;
    init)
        cat <<EOF
Install \`cargo\` and \`Tuckr\`.

USAGE:

$SCRIPT init [OPTIONS...]

OPTIONS:

-h --help   Display this message.
EOF
        ;;
    list)
        cat <<EOF
List tools by category.

USAGE:

$SCRIPT list [OPTIONS...] [CATEGORIES...]

CATEGORIES:

shells  Terminal shells.
cli     Command Line Interface utilities.
all     List all tools.

OPTIONS:

-h --help   Display this message.

EXAMPLES:

Install CLI tools using cargo:

$> cargo install --locked \$($SCRIPT list cli)
EOF
        ;;
    *)
        echo -n "$SCRIPT: unknown command $1"
        exit 1
        ;;
    esac
}

main "$@"
