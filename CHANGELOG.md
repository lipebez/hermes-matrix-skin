# Changelog

All notable changes to HERMATRIX are documented here.

This project follows semantic versioning (`vMAJOR.MINOR.PATCH`) for public GitHub releases.

## [v1.1.0] - 2026-06-26

### Changed

- Promoted the polished HERMATRIX banner layout with a centered `Wake up, Operator...` top row.
- Removed the old `THE SOURCE IS ONLINE` row from the public skin.
- Added aligned kana rails around the large HERMATRIX ASCII banner.
- Rebalanced the large ASCII logo spacing so the left and right sides breathe more evenly.
- Changed divider rows to true full-width visual rules.
- Brightened the low-end digital-rain greens for better visibility.
- Cleaned the rain hero by moving numbers away from the edges and keeping kana on the borders.
- Framed the `H E R M E S   M A T R I X` hero identity line with single kana edge markers.
- Replaced `vertical rain :: operator link` with `operator signal locked`.
- Refined the 14 thinking verbs with more immersive operator/construct language.
- Updated the help header to `⣿ Operator Protocols`.

### Fixed

- Hardened `customize.sh` so personalized names rebuild the entire `Wake up, <name>...` row and preserve the 78-column banner width.
- Added equivalent fixed-width wake-line rebuilding logic to `customize.ps1` for Windows PowerShell.
- Kept response-label personalization and backup creation intact while improving layout stability.

### Verification

- Verified the canonical `matrix` skin via YAML parse and `hermes_cli.skin_engine.load_skin("matrix")`.
- Verified banner geometry: `banner_logo` rows at 78 visible columns and `banner_hero` rows at 33 visible columns.
- Verified `customize.sh` in isolated temporary `HERMES_HOME` directories with `Neo`, `Filipe Bezerra`, `Alexandre-Morpheus`, and `A/B & C`.
- Verified `customize.ps1` recentering contract statically; runtime PowerShell smoke test still requires a Windows/PowerShell environment.

## [v1.0.0] - 2026-06-26

### Added

- First formal versioned GitHub release for the HERMATRIX skin.
- Native Windows PowerShell installer: `install.ps1`.
- Native Windows PowerShell personalizer: `customize.ps1`.
- README instructions split by platform: macOS/Linux/WSL/Git Bash and Windows PowerShell.
- Manual Windows install instructions targeting `%LOCALAPPDATA%\hermes\skins\matrix.yaml`.

### Fixed

- Fixed Windows install path mismatch: Hermes on native Windows reads custom skins from `%LOCALAPPDATA%\hermes`, while the original Bash-only installer wrote to `$HOME/.hermes`.
- Updated Bash installer and personalizer to respect `HERMES_HOME`.
- Added Git Bash/MSYS/Cygwin detection so Bash on Windows installs to the same Hermes home used by the Windows Hermes app.
- Hardened installer downloads by writing to a temporary file first and aborting on empty downloads.
- Hardened Bash personalizer for names containing shell/sed-sensitive characters such as `/` and `&`.

### Notes

- Skin technical name remains `matrix`.
- Visual identity remains `HERMATRIX`.
- Activate after install with `/skin matrix`.

[v1.0.0]: https://github.com/lipebez/hermes-matrix-skin/releases/tag/v1.0.0
[v1.1.0]: https://github.com/lipebez/hermes-matrix-skin/releases/tag/v1.1.0
