Hey everyone — sharing a new update for **HERMATRIX**, a premium Matrix-inspired skin for Hermes Agent.

Repo: https://github.com/lipebez/hermes-matrix-skin

## What's new in v1.1.0

This update is mostly visual polish + safer personalization:

- Reworked the main banner around a centered `Wake up, Operator...` line.
- Added aligned kana side rails to the big HERMATRIX ASCII logo.
- Removed stray edge digits and cleaned up the Matrix rain block.
- Made divider rows full-width and balanced the logo spacing.
- Brightened the darker green rain rows so the banner is more readable.
- Preserved and framed the `H E R M E S   M A T R I X` identity line.
- Replaced the old `vertical rain :: operator link` caption with `operator signal locked`.
- Refined the thinking messages with more operator/construct-style phrases like `tracing the signal`, `syncing operator uplink`, and `rewriting the construct`.
- Updated the help header to `⣿ Operator Protocols`.

## Windows / personalization improvements

The personalizer scripts are also safer now:

- `customize.sh` rebuilds the full wake-up row so names like `Filipe Bezerra` or `Alexandre-Morpheus` stay visually centered.
- `customize.ps1` has equivalent fixed-width logic for Windows PowerShell.
- Native Windows install continues to target `%LOCALAPPDATA%\hermes`, matching where Hermes reads user skins.

Install:

```bash
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/install.sh | bash
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/install.ps1 | iex
```

Then:

```text
/skin matrix
```
