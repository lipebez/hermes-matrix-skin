# Changelog

All notable changes to HERMATRIX are documented here.

This project follows semantic versioning (`vMAJOR.MINOR.PATCH`) for public GitHub releases.

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
