# Menu, Loader, and Doodles Amendment

## Goal

Add a believable in-store menu to the Brew & Butter demo, clearly separate online ordering from the cafe menu, replace the text-based loading screen with the cafe logo and a custom coffee animation, and increase the hand-drawn personality without losing the premium editorial direction.

## In-Store Menu

Replace the three promotional menu cards with a two-column menu board:

- `Brew` contains cafe drinks.
- `Butter` contains pastries and sweets.
- Each item includes a short description, a dotted visual leader, and a USD price.
- The menu is explicitly labeled as an in-store selection.
- Toters remains available only through a separate `Order online` action below the menu.

### Brew

- Espresso — short and bold — $5
- Americano — espresso and hot water — $5
- Cappuccino — espresso, steamed milk, foam — $6
- Flat White — double shot and microfoam — $6
- Latte — smooth espresso and milk — $6
- Spanish Latte — sweet and creamy — $7
- Iced Matcha — bright ceremonial matcha — $7
- Cold Brew — slow steeped and chilled — $8

### Butter

- Cookie — baked soft in the center — $5
- Butter Croissant — flaky house classic — $5
- Pain au Chocolat — buttery layers and chocolate — $6
- Cinnamon Roll — warm spice and glaze — $6
- Éclair — filled and finished daily — $7
- Basque Cheesecake — caramelized top, creamy center — $8

## Loader

- Remove all store-name text from the loading screen.
- Center `photos/logo.png` as the main mark.
- Add a hand-drawn steam animation above the logo.
- Add a small orbiting coffee bean or dot around the logo.
- Keep the loading sequence under one second before transitioning into the existing hero introduction.
- Reduced-motion users see a static logo and immediate page reveal.

## Doodle Expansion

- Add two to three small accents per desktop section.
- Use only the established red, yellow, and cyan.
- Add stars, steam marks, arrows, underlines, rings, and short squiggles.
- Keep accents outside paragraphs, menu prices, navigation labels, and buttons.
- Hide secondary accents on mobile so content remains calm and readable.
- Draw selected SVG strokes once on entry; do not use continuous spinning.

## Responsive Behavior

- Desktop menu uses two columns.
- Mobile menu stacks Brew above Butter.
- Menu rows keep names, dotted leaders, and prices on one readable line.
- Descriptions wrap beneath item names without shifting prices.
- Loader logo scales down cleanly at 320px.

## Verification

- Confirm every listed menu item and price appears.
- Confirm Toters is labeled `Order online`.
- Confirm the loader contains the logo but no `loader-brand` text.
- Confirm steam and orbit elements exist.
- Confirm at least eight doodle SVGs exist across the page.
- Confirm reduced-motion and mobile behavior remain present.
