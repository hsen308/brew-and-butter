# Heart and Cup Doodles with Simplified Loader

## Goal

Give the Brew & Butter demo more hand-drawn personality across the full website while simplifying the opening animation.

## Loader

- Keep the dark background and centered circular logo.
- Remove the steam SVG and orbiting bean.
- Add one short yellow progress line beneath the logo.
- Animate the logo with a quick fade and slight scale.
- Fill the progress line once, then reveal the hero.
- Keep the complete loader sequence below one second.
- Reduced-motion users see the logo briefly without animated scaling or progress.

## Doodle System

Use three to four accents per desktop section and one to two per mobile section.

### Visual Vocabulary

- Outline hearts
- Coffee cups with small steam marks
- Coffee beans
- Stars and sparkles
- Arrows, underlines, arcs, and short squiggles

All doodles use the existing red, yellow, and cyan palette. They remain outline-based and hand-drawn rather than becoming filled illustrations.

### Placement

- Hero: yellow arc, cyan stars, and a small red heart.
- Story: yellow squiggle, red arrow, and cyan coffee cup.
- Menu: red arc, cyan steam mark, yellow underline, and a red heart.
- Moments: cyan zigzag, red ring, yellow sparkle, and a cyan coffee cup.
- Visit: yellow burst, cyan route line, and a red heart.
- Footer: red circle, yellow star, and a cyan coffee cup.

Doodles must stay outside paragraphs, menu prices, navigation, buttons, and important faces or products in photographs.

## Motion

- Reuse the existing one-time SVG stroke drawing animation.
- Do not add continuous spinning, bouncing, or pulsing.
- Loader progress animates once.
- Doodles enter only when their section first scrolls into view.

## Responsive Behavior

- Desktop sections show three to four accents.
- Tablet layouts may hide accents that overlap content.
- Mobile shows only the strongest one or two accents per section.
- Decorative SVGs remain hidden from assistive technology.

## Verification

- Loader includes `loader-logo`, `loader-line`, and `loader-progress`.
- Loader no longer contains `loader-steam` or `loader-orbit`.
- At least three heart doodles and three cup doodles exist.
- Every major section contains decorative artwork.
- Mobile hiding rules and reduced-motion handling remain present.
