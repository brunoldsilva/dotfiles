#!/bin/bash

# Installation script for dotfiles and common utilities.
#
# Usage:
#
# ```bash
# # From the dotfiles folder. Will install dotfiles to $HOME folder.
# scripts/install.sh
# ```

set -e

function install_packages_zypper() {
    echo "todo"
}

function install_packages_apt() {
    echo "Installing packages available through apt."
    sudo apt update && sudo apt upgrade -y && sudo apt install -y stow zsh

    if ! command -v cargo 1>/dev/null 2>&1
    then
        echo "Fetching Cargo to install Rust packages."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi

    echo "Installing packages available through Cargo."
    cargo install --locked cargo-binstall
    cargo binstall starship zoxide ripgrep fd-find ouch bat eza
}

function install_omz_plugins() {
    local custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    if [ ! -d "${custom}/plugins/zsh-syntax-highlighting" ]
    then
        echo "Installing zsh-syntax-highlighting plugin."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
            "${custom}/plugins/zsh-syntax-highlighting"
    fi

    if [ ! -d "${custom}/plugins/zsh-autosuggestions" ]
    then
        echo "Installing zsh-autosuggestions plugin."
        git clone https://github.com/zsh-users/zsh-autosuggestions.git \
            "${custom}/plugins/zsh-autosuggestions"
    fi

    if [ ! -d "${custom}/plugins/zsh-autocomplete" ]
    then
        echo "Installing zsh-autocomplete plugin."
        git clone https://github.com/marlonrichert/zsh-autocomplete.git \
            "${custom}/plugins/zsh-autocomplete"
    fi
}

function main() {
    echo "Running utilities installation script."

    if [ "${PWD##*/}" != "dotfiles" ]
    then
        echo "Error: wrong path. Should run this script from the dotfiles folder."
    fi

    # Install packages.
    if command -v zypper 1>/dev/null 2>&1
    then
        echo "Found zypper package manager."
        install_packages_zypper
    elif command -v apt 1>/dev/null 2>&1
    then
        echo "Found apt package manager."
        install_packages_apt
    else
        echo "No package manager found."
        return 1
    fi

    # Install Oh-My-Zsh.
    if [ -z "$ZSH" ] || [ "${ZSH##*/}" != ".oh-my-zsh" ]
    then
        echo "Installing Oh-My-Zsh."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    echo "Installing Oh-My-Zsh plugins."
    install_omz_plugins

    # Install dotfiles to the home folder.
    echo "Installing dotfiles."
    stow --verbose=2 --target="$HOME" .
    echo "Done."
}

main
