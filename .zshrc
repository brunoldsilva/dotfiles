export ZPLUG_HOME="$HOME/.zplug"

if [ ! -d  "$ZPLUG_HOME" ]; then
    echo 'Installing zplug to manage zsh plugins.'
    git clone https://github.com/zplug/zplug.git "$ZPLUG_HOME"
fi

# Use zplug to manage plugins for zsh.
# shellcheck disable=SC1091
source "$ZPLUG_HOME/init.zsh"

# Adds aliases for common git commands.
zplug "plugins/git", from:oh-my-zsh

# Automatically completes shell commands.
zplug "marlonrichert/zsh-autocomplete"

# Suggests commands when typing in the shell.
zplug "zsh-users/zsh-autosuggestions"

# Highlights text on the shell.
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins that haven't been installed already.
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH.
zplug load

# Aliases for shell commands.
alias ll="eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git"
alias la="eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --all"
alias lt="eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --tree --level=2"
alias bat="bat --theme=TwoDark"

# Use zoxide as an alternative to cd.
eval "$(zoxide init --cmd cd zsh)"

# Use Starship as the default prompt.
eval "$(starship init zsh)"
