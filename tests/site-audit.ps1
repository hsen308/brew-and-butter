$html = Get-Content -LiteralPath (Join-Path $PSScriptRoot '..\index.html') -Raw
$failures = [System.Collections.Generic.List[string]]::new()

function Require-Match([string]$Pattern, [string]$Message) {
  if ($html -notmatch $Pattern) {
    $failures.Add($Message)
  }
}

function Forbid-Match([string]$Pattern, [string]$Message) {
  if ($html -match $Pattern) {
    $failures.Add($Message)
  }
}

Require-Match 'class="skip-link"' 'Missing skip link'
Require-Match 'id="story"' 'Missing story section'
Require-Match 'id="menu"' 'Missing menu section'
Require-Match 'id="moments"' 'Missing moments section'
Require-Match 'id="visit"' 'Missing visit section'
Require-Match 'aria-expanded="false"' 'Mobile menu lacks aria-expanded'
Require-Match 'prefers-reduced-motion' 'Missing reduced-motion handling'
Require-Match 'class="loader-progress"' 'Loader progress element is missing'
Require-Match "typeof ScrollTrigger === 'undefined'" 'Missing ScrollTrigger failure fallback'
Require-Match 'photo_1_2026-06-15_18-28-18\.jpg' 'New pastry image is unused'
Require-Match 'photo_2_2026-06-15_18-28-18\.jpg' 'New overhead drinks image is unused'
Require-Match 'photo_3_2026-06-15_18-28-18\.jpg' 'New pink latte image is unused'
Require-Match 'photo_4_2026-06-15_18-28-18\.jpg' 'New customer image is unused'
Require-Match 'photo_5_2026-06-15_18-28-18\.jpg' 'New iced drinks image is unused'
Forbid-Match 'placeholders?|confirm yours|add number|instagram\.com/' 'Placeholder business content remains'
Forbid-Match 'cup-trim\.png|cup-img|cup-blob' 'Old cup artwork remains'
Forbid-Match "loader-line::after" 'JavaScript cannot animate a CSS pseudo-element directly'

$heroCount = ([regex]::Matches($html, 'croissant coffee and store front\.JPG')).Count
if ($heroCount -ne 1) {
  $failures.Add("Hero photo should appear once; found $heroCount")
}

if ($failures.Count) {
  $failures | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output 'Site audit passed.'
