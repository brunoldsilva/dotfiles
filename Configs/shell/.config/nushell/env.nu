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
if (which starship | is-not-empty) {
    let starship_file = $"($env.HOME)/.cache/starship/init.nu"
    if ($starship_file | path exists) == false {
        mkdir $"($env.HOME)/.cache/starship"
        starship init nu | save --force $starship_file
    }
}

# Initialize zoxide.
if (which zoxide | is-not-empty) {
    let zoxide_file = $"($env.HOME)/.cache/zoxide/init.nu"
    if ($zoxide_file | path exists) == false {
        mkdir $"($env.HOME)/.cache/zoxide"
        zoxide init --cmd cd nushell | save --force $zoxide_file
    }
}

# Initialize carapace.
if (which carapace | is-not-empty) {
    let carapace_file = $"($env.HOME)/.cache/carapace/init.nu"
    if ($carapace_file | path exists) == false {
        mkdir $"($env.HOME)/.cache/carapace"
        carapace _carapace nushell | save --force $carapace_file
    }
}
