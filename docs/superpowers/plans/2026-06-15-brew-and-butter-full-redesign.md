# Brew & Butter Full Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the current placeholder-heavy single page with the approved editorial cafe demo, distinct photography, controlled doodles, responsive layouts, and restrained motion.

**Architecture:** Keep the existing single-file static architecture and replace the page markup, embedded styles, and embedded script in `index.html`. Add one PowerShell audit script that checks the finished HTML for required sections, image uniqueness, removed placeholders, accessibility hooks, and responsive/motion features.

**Tech Stack:** HTML5, CSS, vanilla JavaScript, GSAP 3, ScrollTrigger, PowerShell validation.

---

### Task 1: Add the Static Audit

**Files:**
- Create: `tests/site-audit.ps1`

- [ ] **Step 1: Write the failing audit**

Create `tests/site-audit.ps1` with checks for:

```powershell
$html = Get-Content -LiteralPath (Join-Path $PSScriptRoot '..\index.html') -Raw
$failures = [System.Collections.Generic.List[string]]::new()

function Require-Match([string]$Pattern, [string]$Message) {
  if ($html -notmatch $Pattern) { $failures.Add($Message) }
}

function Forbid-Match([string]$Pattern, [string]$Message) {
  if ($html -match $Pattern) { $failures.Add($Message) }
}

Require-Match 'class="skip-link"' 'Missing skip link'
Require-Match 'id="story"' 'Missing story section'
Require-Match 'id="menu"' 'Missing menu section'
Require-Match 'id="moments"' 'Missing moments section'
Require-Match 'id="visit"' 'Missing visit section'
Require-Match 'aria-expanded="false"' 'Mobile menu lacks aria-expanded'
Require-Match 'prefers-reduced-motion' 'Missing reduced-motion handling'
Require-Match 'photo_1_2026-06-15_18-28-18\.jpg' 'New pastry image is unused'
Require-Match 'photo_2_2026-06-15_18-28-18\.jpg' 'New overhead drinks image is unused'
Require-Match 'photo_3_2026-06-15_18-28-18\.jpg' 'New pink latte image is unused'
Require-Match 'photo_4_2026-06-15_18-28-18\.jpg' 'New customer image is unused'
Require-Match 'photo_5_2026-06-15_18-28-18\.jpg' 'New iced drinks image is unused'
Forbid-Match 'placeholders?|confirm yours|add number|instagram\.com/' 'Placeholder business content remains'
Forbid-Match 'cup-trim\.png|cup-img|cup-blob' 'Old cup hero remains'

$heroCount = ([regex]::Matches($html, 'croissant coffee and store front\.JPG')).Count
if ($heroCount -ne 1) { $failures.Add("Hero photo should appear once; found $heroCount") }

if ($failures.Count) {
  $failures | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output 'Site audit passed.'
```

- [ ] **Step 2: Run the audit and verify it fails**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tests/site-audit.ps1
```

Expected: failure listing missing sections and remaining placeholder content.

### Task 2: Replace the Page Structure and Copy

**Files:**
- Modify: `index.html`

- [ ] **Step 1: Replace the body markup**

Replace the existing body with semantic markup containing:

```html
<a class="skip-link" href="#main">Skip to content</a>
<div id="loader" aria-hidden="true">...</div>
<header id="header">...</header>
<main id="main">
  <section id="hero" aria-labelledby="hero-title">...</section>
  <section id="story" aria-labelledby="story-title">...</section>
  <section id="menu" aria-labelledby="menu-title">...</section>
  <section id="moments" aria-labelledby="moments-title">...</section>
  <section id="visit" aria-labelledby="visit-title">...</section>
</main>
<footer>...</footer>
```

Use the exact section content and photo assignments from `docs/superpowers/specs/2026-06-15-brew-and-butter-full-site-design.md`. Remove prices, unconfirmed hours, generic Instagram, incomplete telephone content, and every placeholder notice.

- [ ] **Step 2: Add the curated menu**

Add exactly three menu cards:

```html
<article class="menu-card">
  <img src="photos/photo_5_2026-06-15_18-28-18.jpg" alt="Iced matcha and iced coffee on a pink cafe table">
  <span class="menu-index">01</span>
  <h3>Iced duo</h3>
  <p>Matcha or coffee, always made for slow mornings.</p>
</article>
```

Repeat the structure for `Pastry lineup` with `photo_1...jpg` and `Pink latte` with `photo_3...jpg`.

- [ ] **Step 3: Add distinct gallery images**

Use `photo_2...jpg`, `coffee with heart.JPG`, `machine.JPG`, and `photo_4...jpg` once each in the moments gallery with descriptive alt text.

- [ ] **Step 4: Run the audit**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tests/site-audit.ps1
```

Expected: failures are limited to styling or interaction checks not yet implemented.

### Task 3: Build the Editorial Visual System

**Files:**
- Modify: `index.html`

- [ ] **Step 1: Replace the embedded CSS**

Define tokens and layout primitives:

```css
:root {
  --paper: #f8f1e6;
  --paper-deep: #efe4d3;
  --ink: #24170f;
  --muted: #726154;
  --red: #ee3c31;
  --yellow: #ffd447;
  --cyan: #20aabd;
  --line: #d8cab7;
  --white: #fffdf7;
  --max: 1240px;
  --radius: 24px;
  --ease: cubic-bezier(.22, 1, .36, 1);
}
```

Add:

- Desktop two-column hero and square postcard image.
- Mobile image-first hero with no overlaps.
- Story two-column block.
- Three-card curated menu grid.
- Dark four-image moments gallery.
- Two-column visit section and dark footer.
- Fluid type with `clamp()`.
- Minimum 44px controls.
- Visible `:focus-visible` outlines.
- A full-screen accessible mobile menu.

- [ ] **Step 2: Add controlled doodles**

Style `.doodle`, `.doodle-arc`, `.doodle-squiggle`, and `.doodle-burst` with rounded SVG strokes. Keep each section to at most two doodles and hide nonessential accents below 640px.

- [ ] **Step 3: Add responsive breakpoints**

Implement breakpoints at 900px and 640px. At 900px:

```css
.hero-layout,
.story-layout,
.visit-layout {
  grid-template-columns: 1fr;
}

.hero-visual {
  order: -1;
}
```

At 640px, stack menu cards and use a stable two-column moments grid. Confirm all content reflows at 320px without horizontal scrolling.

- [ ] **Step 4: Run the audit**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tests/site-audit.ps1
```

Expected: only interaction or animation checks may remain.

### Task 4: Implement Navigation and Motion

**Files:**
- Modify: `index.html`

- [ ] **Step 1: Implement accessible mobile navigation**

Update the menu button and script:

```html
<button id="navToggle" class="nav-toggle" aria-label="Open menu" aria-expanded="false" aria-controls="navLinks">
  <span></span><span></span>
</button>
```

Toggle `.open`, update `aria-expanded`, update the label between `Open menu` and `Close menu`, close on navigation click, and close on `Escape`.

- [ ] **Step 2: Implement the loader and hero sequence**

Use one GSAP timeline:

```js
function playHeroIntro() {
  return gsap.timeline({ defaults: { ease: 'power3.out' } })
    .from('.site-header', { autoAlpha: 0, y: -14, duration: .28 })
    .from('.hero-kicker', { autoAlpha: 0, y: 18, duration: .25 }, '-=.08')
    .from('.hero-title .line', { autoAlpha: 0, yPercent: 105, stagger: .08, duration: .42 }, '-=.12')
    .from('.hero-card', { autoAlpha: 0, scale: .94, rotation: -2, duration: .5 }, '-=.38')
    .from('.hero-support, .hero-actions, .trust-item', { autoAlpha: 0, y: 16, stagger: .05, duration: .28 }, '-=.24');
}
```

Start it when the shortened loader exits. Keep total visible sequence between 1.15 and 1.25 seconds.

- [ ] **Step 3: Implement scroll reveals**

Use ScrollTrigger for `.reveal`, `.menu-card`, `.moment`, and `.doodle path`. Do not animate every line of body copy and do not use infinite spinning. Allow only a subtle desktop hover transform on the hero postcard.

- [ ] **Step 4: Implement reduced motion**

When reduced motion is active:

```js
if (reduceMotion) {
  document.documentElement.classList.add('reduce-motion');
  document.querySelectorAll('.reveal').forEach((el) => el.classList.add('is-visible'));
}
```

Do not create GSAP entrance or idle animations in this mode.

- [ ] **Step 5: Run the audit**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tests/site-audit.ps1
```

Expected: `Site audit passed.`

### Task 5: Validate the Finished Demo

**Files:**
- Modify if needed: `index.html`
- Test: `tests/site-audit.ps1`

- [ ] **Step 1: Check HTML content**

Run:

```powershell
rg -n "placeholder|confirm yours|add number|cup-img|cup-blob|instagram.com/" index.html
```

Expected: no matches.

- [ ] **Step 2: Check photo uniqueness**

Run:

```powershell
rg -o "photos/[^\"']+" index.html | Group-Object | Sort-Object Count -Descending | Format-Table Count,Name
```

Expected: each major content photo appears once; logo assets may repeat.

- [ ] **Step 3: Check desktop and mobile rendering**

Open the page in the in-app browser and inspect:

- 1440x900
- 1024x768
- 390x844
- 320x568

Expected: no clipped headline, no horizontal overflow, full hero photo visible on mobile, usable navigation, stable gallery, and 44px controls.

- [ ] **Step 4: Check keyboard and reduced motion**

Tab through navigation and actions and verify visible focus. Emulate reduced motion and verify all content is immediately visible without entrance animation.

- [ ] **Step 5: Run the final audit**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tests/site-audit.ps1
```

Expected: `Site audit passed.`

The directory is not a Git repository, so commit steps are intentionally omitted.
