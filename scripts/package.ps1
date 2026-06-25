# Build the Tuesday download packs as cross-platform ZIPs (forward-slash paths),
# in both languages: Hebrew kit + English kit, two stations each = four zips.
# Windows Compress-Archive writes backslash separators, which break some unzip
# tools. System.IO.Compression with an explicit .Replace('\','/') guarantees
# POSIX-style entry names, each pack wrapped in one root folder.
#
#   English kit (data/tuesday-brand/):
#     dist/tuesday-station1-raw-en.zip          raw/ materials (input to brand-voice)
#     dist/tuesday-station2-brand-pack-en.zip   brand sheet + visual brief + 5 briefs + backup voice
#   Hebrew kit (data/tuesday-brand-he/):
#     dist/tuesday-station1-raw-he.zip
#     dist/tuesday-station2-brand-pack-he.zip
#
# The engineered prompts are NOT shipped in any zip — they live as copy blocks
# on index.html, in both languages (Hebrew in the Hebrew view, English in the
# English view). The backup/brand-voice.md is a fallback for learners stuck in
# station 1; the real exercise is to generate their own.
#
# Usage:
#   pwsh ./scripts/package.ps1

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot          # = tuesday/
$dist = Join-Path $root "dist"

New-Item -ItemType Directory -Force -Path $dist | Out-Null
Add-Type -AssemblyName System.IO.Compression | Out-Null
Add-Type -AssemblyName System.IO.Compression.FileSystem | Out-Null

function New-Zip {
  param(
    [Parameter(Mandatory = $true)][string]$ZipName,
    [Parameter(Mandatory = $true)][string[]]$Files,   # absolute paths
    [Parameter(Mandatory = $true)][string]$BaseDir    # entry name = ZipName/<path relative to BaseDir>
  )
  $zipPath = Join-Path $dist ($ZipName + ".zip")
  if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
  $fs  = [System.IO.File]::Open($zipPath, [System.IO.FileMode]::CreateNew)
  $zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)
  try {
    foreach ($f in $Files) {
      if (-not (Test-Path $f)) { throw "missing file: $f" }
      $rel = $f.Substring($BaseDir.Length).TrimStart('\', '/').Replace('\', '/')
      $entry = $zip.CreateEntry($ZipName + '/' + $rel, [System.IO.Compression.CompressionLevel]::Optimal)
      $es = $entry.Open()
      $bytes = [System.IO.File]::ReadAllBytes($f)
      $es.Write($bytes, 0, $bytes.Length)
      $es.Dispose()
    }
  } finally {
    $zip.Dispose(); $fs.Dispose()
  }
  Write-Output ("packaged " + $ZipName + ".zip (" + $Files.Count + " files)")
}

$langs = @(
  @{ suffix = "en"; data = Join-Path $root "data\tuesday-brand" },
  @{ suffix = "he"; data = Join-Path $root "data\tuesday-brand-he" }
)

$station2Names = @(
  "brand-sheet.md", "visual-brief.md",
  "outreach-context.md", "welcome-points.md", "social-seed.md", "carousel-outline.md", "character-brief.md",
  "backup\brand-voice.md"
)

foreach ($l in $langs) {
  # Station 1 — raw materials only
  $rawDir   = Join-Path $l.data "raw"
  $rawFiles = Get-ChildItem -Path $rawDir -Recurse -File -Force | ForEach-Object { $_.FullName }
  New-Zip -ZipName ("tuesday-station1-raw-" + $l.suffix) -Files $rawFiles -BaseDir $rawDir

  # Station 2 — brand sheet, visual brief, the five briefs, plus the backup voice file
  $station2 = $station2Names | ForEach-Object { Join-Path $l.data $_ }
  New-Zip -ZipName ("tuesday-station2-brand-pack-" + $l.suffix) -Files $station2 -BaseDir $l.data
}
