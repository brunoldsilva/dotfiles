# Configure the history file.
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# Configure the history command.
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Configure keybindings.
bindkey -e '^[[1;5C' forward-word   # [Ctrl-RightArrow] - move forward one word
bindkey -e '^[[1;5D' backward-word  # [Ctrl-LeftArrow] - move backward one word

# Install zplug if not already installed.
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
