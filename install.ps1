$ErrorActionPreference = "Stop"

$Repo = "https://raw.githubusercontent.com/lipebez/hermes-matrix-skin/main"
$SkinName = "matrix"

function Get-HermesHome {
    if (-not [string]::IsNullOrWhiteSpace($env:HERMES_HOME)) {
        return $env:HERMES_HOME
    }

    if ($env:OS -eq "Windows_NT" -and -not [string]::IsNullOrWhiteSpace($env:LOCALAPPDATA)) {
        return (Join-Path $env:LOCALAPPDATA "hermes")
    }

    return (Join-Path $HOME ".hermes")
}

$HermesHome = Get-HermesHome
$TargetDir = Join-Path $HermesHome "skins"
$TargetFile = Join-Path $TargetDir "$SkinName.yaml"

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

if (Test-Path -LiteralPath $TargetFile) {
    $Backup = "$TargetFile.backup.$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Copy-Item -LiteralPath $TargetFile -Destination $Backup -Force
    Write-Host "Existing matrix skin backed up to: $Backup"
}

$TempFile = [System.IO.Path]::GetTempFileName()
try {
    Invoke-WebRequest -Uri "$Repo/skins/$SkinName.yaml" -OutFile $TempFile -UseBasicParsing

    if ((Get-Item -LiteralPath $TempFile).Length -le 0) {
        throw "Downloaded skin is empty. Aborting."
    }

    Move-Item -LiteralPath $TempFile -Destination $TargetFile -Force
}
finally {
    if (Test-Path -LiteralPath $TempFile) {
        Remove-Item -LiteralPath $TempFile -Force
    }
}

Write-Host "HERMATRIX installed at: $TargetFile"
Write-Host "Open Hermes and run: /skin matrix"
