# Brew & Butter Full-Site Redesign

## Goal

Create a highly polished sales demo that convinces the cafe owner the website is custom, premium, and ready to represent the brand. The page should feel finished even though production business details have not yet been confirmed.

## Design Direction

Use a bright editorial cafe aesthetic:

- Warm cream paper backgrounds and dark espresso sections.
- Bold condensed display typography with clean supporting text.
- Real photography as the main visual language.
- Hand-drawn doodles as controlled punctuation, not background clutter.
- Red as the primary action color, with yellow and cyan used sparingly.
- Rounded editorial frames, quiet borders, and restrained rotation.

## Page Structure

1. Fixed navigation with Story, Menu, Moments, Visit, and Order.
2. Premium postcard hero with location, headline, two actions, and trust strip.
3. Short brand story using the brunch lifestyle photograph.
4. Three curated menu highlights without prices.
5. Dark "Morning Moments" gallery with four distinct photographs.
6. Visit section with location, directions, Toters ordering, and embedded map.
7. Dark premium footer with navigation and Novu Studios credit.

## Photography Assignment

Each major photograph has one primary role:

- Hero: `croissant coffee and store front.JPG`
- Story: `brunch.JPG`
- Menu iced drinks: `photo_5_2026-06-15_18-28-18.jpg`
- Menu pastries: `photo_1_2026-06-15_18-28-18.jpg`
- Menu pink latte: `photo_3_2026-06-15_18-28-18.jpg`
- Gallery overhead drinks: `photo_2_2026-06-15_18-28-18.jpg`
- Gallery latte pour: `coffee with heart.JPG`
- Gallery espresso machine: `machine.JPG`
- Gallery customer drinks: `photo_4_2026-06-15_18-28-18.jpg`

Do not repeat a major image elsewhere on the page.

## Doodle System

- Use simple SVG arcs, squiggles, stars, and circles.
- Limit each section to one or two doodle accents.
- Use consistent rounded strokes and the existing red, yellow, and cyan palette.
- Keep doodles outside body copy and critical controls.
- Animate selected strokes once when their section enters the viewport.

## Content Rules

- Remove all placeholder prices and the long fake menu.
- Remove unconfirmed hours, Instagram URL, and phone number.
- Keep the existing Riad El Solh address, Toters link, map link, and 5.0 Google claim.
- Present the menu as a curated preview, not a complete list.
- Keep copy short, confident, and owner-demo ready.

## Motion

- Keep the loader, but shorten and simplify it.
- Hero opening sequence lasts 1.15 to 1.25 seconds after the loader.
- Reveal headline lines, photograph, actions, and trust details in sequence.
- Use subtle section reveals, image masking, and doodle drawing on scroll.
- Avoid constant spinning, excessive floating, or motion on every element.
- Disable all nonessential motion for `prefers-reduced-motion: reduce`.

## Responsive Behavior

- Desktop hero uses a balanced two-column composition.
- Mobile hero shows the full square photograph before the headline and actions.
- Story, menu, gallery, and visit sections become single-column flows.
- Menu cards scroll or stack without clipped text.
- Gallery uses a varied but stable mobile grid.
- Navigation uses an accessible full-screen menu with visible close state.
- Maintain 44px minimum interactive targets and no horizontal overflow at 320px.

## Accessibility

- Add a skip link and visible keyboard focus styles.
- Use semantic landmarks and descriptive headings.
- Keep image alternative text specific to each photograph.
- Expose mobile menu state with `aria-expanded`.
- Ensure sufficient text and control contrast.
- Pause or remove marquee-style movement.

## Verification

- Validate at 1440x900, 1024x768, 390x844, and 320x568.
- Confirm each major photograph appears only once.
- Confirm no placeholder content remains.
- Confirm all internal anchors and external actions work.
- Confirm loader and hero sequence run once.
- Confirm reduced-motion users see content immediately.
- Confirm keyboard navigation and visible focus.
