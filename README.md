# dotfiles

Configuration files and tools for my system.

## Usage

Clone this repository to your home configuration folder.

```bash
git clone https://github.com/brunoldsilva/dotfiles.git "$HOME/.config/dotfiles"
```

Use the `dotfiles.sh` script to install the required tools.

```bash
scripts/dotfiles.sh init
```

Use [Tuckr] to install the configuration files.

```bash
# List configuration groups.
tuckr status

# Install a configuration group.
tuckr add --force shell
```

Use the `dotfiles.sh` script to install additional tools.

```bash
cargo install --locked $(scripts/dotfiles.sh list cli)
```

[Tuckr]: https://github.com/RaphGL/Tuckr

## License

This project is licensed under the [MIT License].

[MIT License]: https://opensource.org/license/MIT/
