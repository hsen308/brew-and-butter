# Menu, Loader, and Doodles Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a complete in-store cafe menu, separate online ordering, a logo-only animated loader, and more controlled hand-drawn accents.

**Architecture:** Keep the single-file static site. Replace the promotional menu-card markup and CSS with a semantic two-column menu board, replace the text loader with logo and SVG animation elements, and extend the existing doodle SVG system without adding new dependencies.

**Tech Stack:** HTML5, CSS, vanilla JavaScript, GSAP 3, ScrollTrigger, PowerShell audit.

---

### Task 1: Expand Audit Coverage

**Files:**
- Modify: `tests/site-audit.ps1`

- [ ] Add requirements for `menu-board`, `menu-column`, `menu-row`, `$5`, `$6`, `$7`, `$8`, `Order online`, `loader-logo`, `loader-steam`, and `loader-orbit`.
- [ ] Forbid `loader-brand` and `View the full menu`.
- [ ] Count `<svg class="doodle` occurrences and fail when fewer than eight exist.
- [ ] Run `powershell -ExecutionPolicy Bypass -File tests/site-audit.ps1`.
- [ ] Verify the audit fails because the approved UI is not implemented yet.

### Task 2: Build the In-Store Menu

**Files:**
- Modify: `index.html`

- [ ] Replace `.menu-grid` and `.menu-card` CSS with `.menu-board`, `.menu-column`, `.menu-list`, `.menu-row`, `.menu-item`, `.menu-description`, `.menu-dots`, and `.menu-price`.
- [ ] Replace the three menu cards with two semantic menu columns headed `Brew` and `Butter`.
- [ ] Add all fourteen approved items, descriptions, and USD prices from the design spec.
- [ ] Change section copy to explain that this is the in-store selection.
- [ ] Rename the Toters button to `Order online`.
- [ ] Update ScrollTrigger selectors from `.menu-card` to `.menu-column` and `.menu-row`.
- [ ] Run the site audit and verify only loader or doodle checks remain.

### Task 3: Build the Logo-Only Loader

**Files:**
- Modify: `index.html`

- [ ] Replace `.loader-brand` markup with:

```html
<div class="loader-mark">
  <svg class="loader-steam" viewBox="0 0 120 70" aria-hidden="true">...</svg>
  <div class="loader-logo-wrap">
    <img class="loader-logo" src="photos/logo.png" alt="">
    <span class="loader-orbit" aria-hidden="true"><i></i></span>
  </div>
</div>
```

- [ ] Style the logo as a centered circular mark and the orbit as a small bean-like ellipse.
- [ ] Animate steam drawing, logo scale/fade, and one partial orbit before the loader exits.
- [ ] Keep the loader sequence under one second.
- [ ] Keep the reduced-motion path static and immediate.
- [ ] Run the audit and verify loader checks pass.

### Task 4: Add More Controlled Doodles

**Files:**
- Modify: `index.html`

- [ ] Add a small star cluster to the hero copy.
- [ ] Add an arrow near the story note.
- [ ] Add a coffee steam accent and underline in the menu section.
- [ ] Add a ring and sparkle to the moments section.
- [ ] Add a short route squiggle near the visit details.
- [ ] Add a small footer star.
- [ ] Ensure no desktop section contains more than three accents and secondary doodles are hidden below 640px.
- [ ] Reuse the existing scroll stroke animation and avoid infinite motion.
- [ ] Run the audit and verify it passes.

### Task 5: Verify and Publish

**Files:**
- Modify if required: `index.html`, `tests/site-audit.ps1`

- [ ] Run the site audit.
- [ ] Parse the inline JavaScript with Node.
- [ ] Verify all IDs and internal anchor targets remain valid.
- [ ] Confirm no placeholder wording or old loader text remains.
- [ ] Commit with `feat: add in-store menu and logo loader`.
- [ ] Push `main` to `https://github.com/hsen308/brew-and-butter.git`.
