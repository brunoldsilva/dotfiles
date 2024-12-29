# Nushell Config File
#
# version = "0.101.0"
#
# A `config.nu` file is used to override default Nushell settings,
# define (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html

# Disable the welcome banner at startup.
$env.config.show_banner = false

# Don't complete partial matches.
$env.config.completions.partial = false

# Initialize zoxide.
if ($"($env.HOME)/.cache/zoxide/init.nu" | path exists) {
    source '~/.cache/zoxide/init.nu'
}

# Initialize carapace.
if ($"($env.HOME)/.cache/carapace/init.nu" | path exists) {
    source '~/.cache/carapace/init.nu'
}

# Initialize starship.
if ($"($env.HOME)/.cache/starship/init.nu" | path exists) {
    source '~/.cache/starship/init.nu'
}

# Define aliases for common ls commands.
alias ll = eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git
alias la = eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --all
alias lt = eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --tree --level=2

# Define aliases for common git commands (based on OhMyZsh).
alias gst = git status
alias glg = git log --stat
alias glgp = git log --stat --patch
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glo = git log --oneline --decorate
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias gsw = git switch
alias gswc = git switch -c
