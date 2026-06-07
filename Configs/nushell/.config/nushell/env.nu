# Nushell Environment Config File
#
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Initialize starship.
let starship_file = $"($env.HOME)/.cache/starship/init.nu"
if not ($starship_file | path exists) {
    mkdir ($starship_file | path dirname)
    if (which starship | is-not-empty) {
        starship init nu | save --force $starship_file
    } else {
        touch $starship_file
    }
}

# Initialize zoxide.
let zoxide_file = $"($env.HOME)/.cache/zoxide/init.nu"
if not ($zoxide_file | path exists) {
    mkdir ($zoxide_file | path dirname)
    if (which zoxide | is-not-empty) {
        zoxide init --cmd cd nushell | save --force $zoxide_file
    } else {
        touch $zoxide_file
    }
}

# Initialize carapace.
let carapace_file = $"($env.HOME)/.cache/carapace/init.nu"
if not ($carapace_file | path exists) {
    mkdir ($carapace_file | path dirname)
    if (which carapace | is-not-empty) {
        carapace _carapace nushell | save --force $carapace_file
    } else {
        touch $carapace_file
    }
}
