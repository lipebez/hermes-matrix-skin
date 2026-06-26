param(
    [string]$Name
)

$ErrorActionPreference = "Stop"

function Get-HermesHome {
    if (-not [string]::IsNullOrWhiteSpace($env:HERMES_HOME)) {
        return $env:HERMES_HOME
    }

    if ($env:OS -eq "Windows_NT" -and -not [string]::IsNullOrWhiteSpace($env:LOCALAPPDATA)) {
        return (Join-Path $env:LOCALAPPDATA "hermes")
    }

    return (Join-Path $HOME ".hermes")
}

if ([string]::IsNullOrWhiteSpace($Name)) {
    Write-Host ""
    Write-Host "  ┌──────────────────────────────────────┐"
    Write-Host "  │   HERMATRIX — Personalize Operator   │"
    Write-Host "  └──────────────────────────────────────┘"
    Write-Host ""
    $Name = Read-Host "  Enter your name (or nickname)"
}

if ([string]::IsNullOrWhiteSpace($Name)) {
    throw "Name cannot be empty."
}

$SkinFile = Join-Path (Join-Path (Get-HermesHome) "skins") "matrix.yaml"

if (-not (Test-Path -LiteralPath $SkinFile)) {
    Write-Host "✖ HERMATRIX skin not found at: $SkinFile"
    Write-Host "  Install it first:"
    Write-Host "  irm https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main/install.ps1 | iex"
    exit 1
}

$Backup = "$SkinFile.backup.$(Get-Date -Format 'yyyyMMdd-HHmmss')"
Copy-Item -LiteralPath $SkinFile -Destination $Backup -Force

$Content = Get-Content -LiteralPath $SkinFile -Raw
$Content = $Content.Replace("Wake up, Operator...", "Wake up, $Name...")
$Content = $Content.Replace("⣿ OPERATOR ", "⣿ $($Name.ToUpperInvariant()) ")
Set-Content -LiteralPath $SkinFile -Value $Content -Encoding UTF8

if ((Get-Content -LiteralPath $SkinFile -Raw).Contains($Name)) {
    Write-Host ""
    Write-Host "  ✔ Operator replaced with: $Name"
    Write-Host "  ✔ Backup saved to: $Backup"
    Write-Host ""
    Write-Host "  Restart Hermes or run: /skin matrix"
    Write-Host ""
} else {
    throw "Could not verify replacement. Check $SkinFile manually."
}
