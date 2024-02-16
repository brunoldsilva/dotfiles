# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugins to be loaded by oh-my-zsh.
plugins=(
    # Adds aliases for common git commands.
    git
    # Automatically completes shell commands.
    zsh-autocomplete
    # Suggests commands when typing in the shell.
    zsh-autosuggestions
    # Highlights text on the shell.
    zsh-syntax-highlighting
)

# Load oh-my-zsh configuration.
source $ZSH/oh-my-zsh.sh

# Aliases for shell commands.
alias ll="eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git"
alias la="eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --all"
alias lt="eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --tree --level=2"
alias bat="bat --theme=TwoDark"

# Use zoxide as an alternative to cd.
eval "$(zoxide init --cmd cd zsh)"

# Use Starship as the default prompt.
eval "$(starship init zsh)"
