## HERMATRIX v1.1.0

A polished visual release for the HERMATRIX skin, focused on making the Matrix-inspired boot/banner experience cleaner, more cinematic, and safer to personalize across platforms.

### Visual polish

- Rebuilt the main banner around a centered `Wake up, Operator...` greeting.
- Removed the old `THE SOURCE IS ONLINE` row and made the greeting the primary hero line.
- Added aligned kana side rails around the large HERMATRIX ASCII logo.
- Removed stray edge digits from the banner and rain blocks.
- Changed divider rows to true full-width visual rules.
- Balanced left/right spacing around the HERMATRIX ASCII art.
- Brightened the low-end green rain colors so the first rain rows are visible without losing the deep Matrix feel.
- Preserved and framed the `H E R M E S   M A T R I X` identity line inside the rain block.
- Replaced the technical `vertical rain :: operator link` caption with the in-world `operator signal locked` caption.

### Interaction polish

- Refined the thinking messages with more immersive operator/construct language:
  - `tracing the signal`
  - `syncing operator uplink`
  - `rewriting the construct`
  - `opening hidden exits`
  - `listening for the oracle`
  - `opening the backdoor`
  - `stabilizing residual self-image`
- Updated the help header to `⣿ Operator Protocols`.

### Personalization / Windows

- Hardened `customize.sh` so personalized names rebuild the whole `Wake up, <name>...` row and keep the 78-column banner width stable.
- Hardened `customize.ps1` with equivalent fixed-width wake-line rebuilding logic for Windows PowerShell.
- Kept support for `HERMES_HOME` and native Windows `%LOCALAPPDATA%\hermes` paths from v1.0.0.

### Verification

Validated with ad-hoc Hermes skin checks:

- `skins/matrix.yaml` parses as YAML.
- The skin loads through `hermes_cli.skin_engine.load_skin("matrix")`.
- Main banner rows stay at 78 visible columns.
- Rain hero rows stay at 33 visible columns.
- `customize.sh` was executed in isolated temporary `HERMES_HOME` directories with short, medium, long, and shell-sensitive names.
- `customize.ps1` fixed-width recentering contract was statically checked; runtime PowerShell smoke test still depends on a Windows/PowerShell environment.
