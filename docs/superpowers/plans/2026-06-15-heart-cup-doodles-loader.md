# Heart and Cup Doodles with Simplified Loader Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Simplify the loader to the approved logo-and-progress-line treatment and add controlled heart and coffee-cup doodles throughout every major section.

**Architecture:** Keep the single-file static site and its existing SVG doodle animation system. Update the PowerShell audit first, then remove loader-only steam/orbit markup and animation, add reusable heart/cup SVG classes, and place one new themed doodle in each major section.

**Tech Stack:** HTML5, CSS, vanilla JavaScript, GSAP 3, ScrollTrigger, PowerShell audit.

---

### Task 1: Expand Audit Coverage

**Files:**
- Modify: `tests/site-audit.ps1`

- [ ] **Step 1: Add simplified-loader requirements**

Require `loader-logo`, `loader-line`, and `loader-progress`. Forbid `loader-steam` and `loader-orbit`.

- [ ] **Step 2: Add themed-doodle requirements**

Count `doodle-heart` and `doodle-cup` classes and fail if either count is below three.

- [ ] **Step 3: Run the audit**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tests/site-audit.ps1
```

Expected: FAIL because the old steam/orbit loader remains and heart/cup doodles do not exist.

### Task 2: Simplify the Loader

**Files:**
- Modify: `index.html`

- [ ] **Step 1: Remove loader steam and orbit CSS**

Delete `.loader-steam`, `.loader-logo-wrap`, `.loader-orbit`, and `.loader-orbit i`. Keep a centered `126px` circular `.loader-logo` and the existing short yellow progress line.

- [ ] **Step 2: Simplify loader markup**

Use:

```html
<div class="loader-mark">
  <img class="loader-logo" src="photos/logo.png" alt="">
</div>
<div class="loader-line"><span class="loader-progress"></span></div>
```

- [ ] **Step 3: Simplify the GSAP sequence**

Animate the logo fade/scale, fill `.loader-progress`, then slide the loader away. Remove all steam and orbit animation steps.

- [ ] **Step 4: Run the audit**

Expected: loader checks pass while heart/cup checks still fail.

### Task 3: Add Heart and Cup Doodles

**Files:**
- Modify: `index.html`

- [ ] **Step 1: Add reusable doodle sizing**

Add shared `.doodle-heart` and `.doodle-cup` styling plus section-specific positions.

- [ ] **Step 2: Add three heart SVGs**

Add `hero-heart`, `menu-heart`, and `visit-heart` using the same hand-drawn outline path.

- [ ] **Step 3: Add three cup SVGs**

Add `story-cup`, `moments-cup`, and `footer-cup`, each with a cup outline, handle, and two short steam strokes.

- [ ] **Step 4: Tune mobile visibility**

Keep only the new heart or cup plus one existing accent per section below `640px`. Reduce widths and move them away from text and buttons.

- [ ] **Step 5: Run the audit**

Expected: `Site audit passed.`

### Task 4: Verify and Commit

**Files:**
- Verify: `index.html`
- Verify: `tests/site-audit.ps1`

- [ ] **Step 1: Parse inline JavaScript**

Run Node against all inline script blocks. Expected: `Inline JavaScript syntax passed.`

- [ ] **Step 2: Check the diff**

Run:

```powershell
git diff --check
git status --short
```

Expected: only the approved spec, plan, `index.html`, and audit changes.

- [ ] **Step 3: Commit**

```powershell
git add index.html tests/site-audit.ps1 docs/superpowers/specs/2026-06-15-heart-cup-doodles-loader-design.md docs/superpowers/plans/2026-06-15-heart-cup-doodles-loader.md
git commit -m "feat: add heart and cup doodles"
```

- [ ] **Step 4: Push**

```powershell
git push origin main
```
