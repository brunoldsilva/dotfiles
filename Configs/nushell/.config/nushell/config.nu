# Nushell Config File
# More info: https://www.nushell.sh/book/configuration.html

# Update the path to include Homebrew binaries.
$env.PATH = ($env.PATH | prepend [
    /home/linuxbrew/.linuxbrew/sbin
    /home/linuxbrew/.linuxbrew/bin
])

# Disable the welcome banner at startup.
$env.config.show_banner = false

# Don't complete partial matches.
$env.config.completions.partial = false

# Use SQLite as the history backend.
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true

# Truncate large tables.
$env.config.table.abbreviated_row_count = 5

# Define aliases for common ls commands.

alias ll = eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git
alias la = eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --all
alias lt = eza --header --long --icons=auto --time-style=long-iso --group-directories-first --git --tree --level=2

# Define aliases for common bat commands.

alias bt = bat --plain --theme TwoDark
alias bl = bat --plain --theme TwoDark --language log

# Define aliases for common git commands.

alias g = git
alias ga = git add
alias gc = git commit
alias gd = git diff
alias gf = git fetch
alias gl = git log
alias gm = git merge
alias gp = git push
alias gs = git status
alias gco = git checkout
alias glo = git log --oneline
alias gsw = git switch

# Define aliases for common just commands.

alias j = just
alias jb = just build
alias jc = just check
alias jr = just run
alias jt = just test

# Define aliases for common Cargo commands.

alias c = cargo
alias cb = cargo build
alias cc = cargo clippy
alias cr = cargo run
alias ct = cargo test

# Define aliases for tealdeer.

alias ? = tldr
