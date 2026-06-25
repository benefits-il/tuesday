# Package any folder into a cross-platform ZIP (forward-slash paths).
# Windows Compress-Archive writes backslash separators, which break plugin
# installers and some unzip tools. System.IO.Compression with an explicit
# .Replace('\','/') guarantees POSIX-style entry names.
#
# Usage:
#   pwsh ./scripts/package.ps1 -Src "plugins/tuesday-studio" -Name "tuesday-studio"
#   pwsh ./scripts/package.ps1 -Src "data/tuesday-brand"     -Name "tuesday-brand"

param(
  [Parameter(Mandatory = $true)][string]$Src,
  [string]$Name
)

$ErrorActionPreference = "Stop"
$root   = Split-Path -Parent $PSScriptRoot          # = tuesday/
$srcDir = Join-Path $root $Src
if (-not $Name) { $Name = Split-Path $Src -Leaf }
$dist   = Join-Path $root "dist"

if (-not (Test-Path $srcDir)) { throw "source folder not found: $srcDir" }

New-Item -ItemType Directory -Force -Path $dist | Out-Null
Add-Type -AssemblyName System.IO.Compression | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem | Out-Null

$zipPath = Join-Path $dist ($Name + ".zip")
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

$fs  = [System.IO.File]::Open($zipPath, [System.IO.FileMode]::CreateNew)
$zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)
try {
  Get-ChildItem -Path $srcDir -Recurse -File -Force | ForEach-Object {
    # CRITICAL: forward slashes, Name as the single root folder
    $rel = $_.FullName.Substring($srcDir.Length).TrimStart('\', '/').Replace('\', '/')
    $entryName = $Name + '/' + $rel
    $entry = $zip.CreateEntry($entryName, [System.IO.Compression.CompressionLevel]::Optimal)
    $es = $entry.Open()
    $bytes = [System.IO.File]::ReadAllBytes($_.FullName)
    $es.Write($bytes, 0, $bytes.Length)
    $es.Dispose()
  }
} finally {
  $zip.Dispose(); $fs.Dispose()
}
Write-Output ("packaged " + $Src + " -> dist/" + $Name + ".zip")
