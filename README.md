# HERMATRIX Skin for Hermes Agent

Premium Matrix-inspired skin for Hermes Agent — deep black cyberpunk aesthetics, cinematic green rain, operator-style boot text, and a bold **HERMATRIX** identity.

![HERMATRIX preview](screenshots/matrix.png)

## Current version

**v1.1.0** — polished Matrix rain/banner release with aligned kana rails, cleaner HERMATRIX geometry, refined operator thinking messages, and safer cross-platform personalization.

- Release notes: [CHANGELOG.md](CHANGELOG.md)
- GitHub releases: <https://github.com/lipebez/hermes-matrix-skin/releases>

## Features

- **Cinematic banner** — ASCII art HERMATRIX with a centered `Wake up, Operator...` greeting, aligned kana side rails, and full-width divider rules
- **Digital rain hero** — katakana/number rain with kana edge rails, brighter low-end greens, framed `H E R M E S   M A T R I X`, and `operator signal locked` caption
- **Binary spinner** — animated faces: `0`, `1`, `01`, `10`, `▓`, `▒`, `░`
- **14 thinking verbs** — immersive operator/construct messages while the agent thinks:
  `following the white rabbit` · `tracing the signal` · `syncing operator uplink` · `rewriting the construct` · `opening hidden exits` · `stabilizing residual self-image` · and more
- **Custom prompt** — `ﾎ> ` with `⣿ OPERATOR` response label
- **Deep green palette** — readable Matrix-green gradient from `#003B12` to `#D8FFE3` on pure black
- **Personalize** — replace "Operator" with your name via one command; the wake-up row is rebuilt to stay aligned for short and longer names

## Install

### macOS / Linux / WSL / Git Bash

```bash
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/install.sh | bash
```

### Windows PowerShell

Use the PowerShell installer instead of `curl ... | bash`:

```powershell
irm https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/install.ps1 | iex
```

Then open Hermes and use:

```text
/skin matrix
```

## Why PowerShell has a separate command

On Windows, Hermes stores user data in `%LOCALAPPDATA%\hermes` by default. The Bash installer also supports Git Bash/MSYS/Cygwin, but PowerShell users should use `install.ps1` so the skin lands in the same Hermes home that the local Windows Hermes app reads.

If you use a custom Hermes home, set `HERMES_HOME` before installing.

## Personalize

Replace **"Operator"** with your name or nickname.

### macOS / Linux / WSL / Git Bash

```bash
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/customize.sh | bash
```

Or pass your name directly:

```bash
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/customize.sh | bash -s "Neo"
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/customize.ps1 | iex
```

Or pass your name directly:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/customize.ps1))) -Name "Neo"
```

This updates the banner greeting (`Wake up, Neo...`) and the response label (`⣿ NEO`). The wake-up row is rebuilt to preserve the 78-column banner layout, and a backup of the original file is created automatically.

## Manual install

### macOS / Linux / WSL

```bash
mkdir -p ~/.hermes/skins
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/skins/matrix.yaml \
  -o ~/.hermes/skins/matrix.yaml
```

### Windows PowerShell

```powershell
New-Item -ItemType Directory -Force "$env:LOCALAPPDATA\hermes\skins"
irm https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/skins/matrix.yaml `
  -OutFile "$env:LOCALAPPDATA\hermes\skins\matrix.yaml"
```

Then use:

```text
/skin matrix
```

## Files

```text
skins/matrix.yaml          # HERMATRIX theme
screenshots/matrix.png     # Preview image
install.sh                 # Bash installer
install.ps1                # PowerShell installer
customize.sh               # Bash personalizer
customize.ps1              # PowerShell personalizer
```

## Notes

- Technical skin name: `matrix`
- Visual identity: `HERMATRIX`
- Public wake-up line: `Wake up, Operator...`
- Versioning: public releases use semantic version tags such as `v1.1.0`.

## License

MIT
