# ps1

Shell prompt (PS1/PROMPT) preset switcher. Supports bash and zsh.

Requires `bash` at runtime.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/nattoujam/ps1/release/install.sh | sudo sh
```

After install, add the following line to your `.zshrc` or `.bashrc`:

```bash
[ -f ~/.config/nattoujam/ps1/current ] && source ~/.config/nattoujam/ps1/current
```

## Usage

```bash
ps1 list          # list available presets (* = current)
ps1 set <name>    # switch to a preset
ps1 help          # show help
```

## Presets

| Name    | Description                          |
|---------|--------------------------------------|
| minimal | Path and prompt char only            |
| simple  | no color                             |
| default | default color theme                  |
| ember   | Orange/purple color theme            |
| slate   | Blue-gray color theme                |
| bloom   | Pink/lavender color theme            |
| mellow  | Soft blue/green color theme          |

## For Developers

Drop `ps1` into your `PATH` and copy `assets/presets` and `assets/helpers` into `~/.config/nattoujam/ps1/`.

```bash
install -m 0755 ps1 ~/.local/bin/ps1
mkdir -p ~/.config/nattoujam/ps1
cp assets/presets assets/helpers ~/.config/nattoujam/ps1/
```
