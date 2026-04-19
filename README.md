# ps1

Shell prompt (PS1/PROMPT) preset switcher. Supports bash and zsh.

> **Platform:** linux/x86_64 only

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

Install locally:

```bash
nimble install_ps1
```
