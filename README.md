# HERMATRIX Skin for Hermes Agent

Premium Matrix-inspired skin for Hermes Agent — deep black cyberpunk aesthetics, cinematic green rain, operator-style boot text, and a bold **HERMATRIX** identity.

![HERMATRIX preview](screenshots/matrix.png)

## Features

- **Cinematic banner** — ASCII art HERMATRIX with iconic Matrix dialogue (`Wake up, Operator...`)
- **Digital rain hero** — vertical katakana/number rain as background
- **Binary spinner** — animated faces: `0`, `1`, `01`, `10`, `▓`, `▒`, `░`
- **14 thinking verbs** — random Matrix-themed messages while the agent thinks:
  `following the white rabbit` · `dodging bullets` · `consulting the oracle` · `jacking in` · `choosing the red pill` · `defying gravity` · `seeing through the code` · and more
- **Custom prompt** — `ﾎ> ` with `⣿ OPERATOR` response label
- **Deep green palette** — full gradient from `#001806` to `#D8FFE3` on pure black
- **Personalize** — replace "Operator" with your name via one command

## Install

Run:

```bash
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/install.sh | bash
```

Then open Hermes and use:

```text
/skin matrix
```

## Personalize

Replace **"Operator"** with your name or nickname:

```bash
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/customize.sh | bash
```

Or pass your name directly:

```bash
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/customize.sh | bash -s "Neo"
```

This updates the banner greeting (`Wake up, Neo...`) and the response label (`⣿ NEO`). A backup of the original file is created automatically.

## Manual install

```bash
mkdir -p ~/.hermes/skins
curl -fsSL https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/skins/matrix.yaml \
  -o ~/.hermes/skins/matrix.yaml
```

Then use:

```text
/skin matrix
```

## Files

```text
skins/matrix.yaml          # HERMATRIX theme
screenshots/matrix.png     # Preview image
install.sh                 # One-command installer
customize.sh               # Replace "Operator" with your name
```

## Notes

- Technical skin name: `matrix`
- Visual identity: `HERMATRIX`
- Public wake-up line: `Wake up, Operator...`

## License

MIT
