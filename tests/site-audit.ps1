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
Require-Match 'overscroll-behavior: contain' 'Mobile overlays should contain scroll'
Require-Match 'max-height: 48svh' 'Cart footer needs a mobile-safe scroll limit'
Require-Match 'border: 2px solid var\(--ink\)' 'Hamburger button needs a visible background and border'
Require-Match 'class="loader-progress"' 'Loader progress element is missing'
Require-Match 'DELIVERY_FEE' 'Delivery fee configuration is missing'
Require-Match 'couponCodes' 'Coupon code configuration is missing'
Require-Match 'BREW10' '10 percent coupon code is missing'
Require-Match 'BREW20' '20 percent coupon code is missing'
Require-Match 'applyCoupon' 'Coupon apply behavior is missing'
Require-Match 'couponCode' 'Coupon code input is missing'
Require-Match 'id="branchGate"' 'Missing first-screen branch selector'
Require-Match 'Downtown Beirut' 'Downtown branch is missing'
Require-Match 'Mousaytbe' 'Mousaytbe branch is missing'
Require-Match 'data-branch-card="downtown"' 'Downtown branch selector card is missing'
Require-Match 'data-branch-card="mousaytbe"' 'Mousaytbe branch selector card is missing'
Require-Match 'id="menuGrid"' 'Dynamic menu grid is missing'
Require-Match 'id="categoryTabs"' 'Menu category tabs are missing'
Require-Match 'id="menuFamilyStrip"' 'Brew/Butter menu labels are missing'
Require-Match 'data-family="brew"' 'Brew drinks label is missing'
Require-Match 'data-family="butter"' 'Butter food label is missing'
Require-Match 'id="itemModal"' 'Item customization modal is missing'
Require-Match 'id="cartDrawer"' 'Cart drawer is missing'
Require-Match 'id="checkoutModal"' 'Checkout modal is missing'
Require-Match 'firstName' 'Checkout first name field is missing'
Require-Match 'lastName' 'Checkout last name field is missing'
Require-Match 'deliveryLocation' 'Checkout location field is missing'
Require-Match 'customerPhone' 'Checkout phone field is missing'
Require-Match 'WHATSAPP_NUMBER' 'WhatsApp number configuration is missing'
Require-Match 'whatsappNumber' 'Branch-specific WhatsApp numbers are missing'
Require-Match 'whatsappBranchLink' 'Branch WhatsApp button is missing'
Require-Match 'buildWhatsAppMessage' 'WhatsApp message builder is missing'
Require-Match 'totersUrl' 'Toters branch URL configuration is missing'
Require-Match '>Order on Toters<' 'Toters order choice is missing'
Require-Match 'Powerbowls' 'Powerbowls section is missing'
Require-Match 'Sandwiches' 'Downtown sandwiches section is missing'
Require-Match 'nutrition' 'Sandwich and Powerbowl nutrition counts are missing'
Require-Match 'calories' 'Calories count is missing from menu data'
Require-Match 'protein' 'Protein count is missing from menu data'
Require-Match 'nutritionDelta' 'Nutrition deltas for add-ons and removals are missing'
Require-Match 'nutritionDeltaLabel' 'Option-level nutrition labels are missing'
Require-Match 'calculateCurrentNutrition' 'Final customized nutrition calculation is missing'
Require-Match 'itemModalFinalNutrition' 'Final nutrition facts panel is missing'
Require-Match 'data-calories' 'Option calorie data is missing'
Require-Match 'data-protein' 'Option protein data is missing'
Require-Match 'Nutrition:' 'Final nutrition should be included in cart and WhatsApp order details'
Require-Match 'Type of milk' 'Coffee milk options are missing'
Require-Match 'blackCoffeeOptions' 'Black coffee option set is missing'
Require-Match 'simplePastryOptions' 'Simple pastry quantity-only setup is missing'
Require-Match "product\('espresso'.*blackCoffeeOptions" 'Espresso should use black coffee options, not milk options'
Require-Match "product\('butter-croissant'.*simplePastryOptions" 'Butter croissant should be quantity-only'
Require-Match "product\('eclair'.*simplePastryOptions" 'Eclair should be quantity-only'
Require-Match "Iced', price: 0" 'Iced drink option should not add a charge'
Require-Match 'Remove stuff' 'Removable item options are missing'
Require-Match 'Extra shot' 'Coffee add-ons are missing'
Require-Match '>Continue shopping<' 'Cart continue shopping action is missing'
Require-Match 'openBranchMap' 'Clickable branch map behavior is missing'
Require-Match 'Mousaytbe%20Beirut' 'Mousaytbe map URL is missing'
Require-Match 'Add to cart' 'Add to cart action is missing'
Require-Match 'class="loader-logo"' 'Loader logo is missing'
Require-Match 'class="loader-line"' 'Loader progress track is missing'
Require-Match 'class="loader-progress"' 'Loader progress fill is missing'
Require-Match 'photo_1_2026-06-15_18-28-18\.jpg' 'New pastry image is unused'
Require-Match 'photo_2_2026-06-15_18-28-18\.jpg' 'New overhead drinks image is unused'
Require-Match 'photo_3_2026-06-15_18-28-18\.jpg' 'New pink latte image is unused'
Require-Match 'photo_4_2026-06-15_18-28-18\.jpg' 'New customer image is unused'
Require-Match 'photo_5_2026-06-15_18-28-18\.jpg' 'New iced drinks image is unused'
Forbid-Match 'placeholders?|confirm yours|add number|instagram\.com/' 'Placeholder business content remains'
Forbid-Match 'cup-trim\.png|cup-img|cup-blob' 'Old cup artwork remains'
Forbid-Match "loader-line::after" 'JavaScript cannot animate a CSS pseudo-element directly'
Forbid-Match 'loader-brand' 'Loader still uses the store name'
Forbid-Match 'loader-steam' 'Loader should no longer use steam artwork'
Forbid-Match 'loader-orbit' 'Loader should no longer use an orbiting symbol'
Forbid-Match 'class="menu-board"' 'Old static Brew/Butter board should be removed'
Forbid-Match "Iced', price: \.5" 'Iced drink option should not cost extra'
Forbid-Match 'FREEDELIVERY' 'Free delivery coupon should be removed'
Forbid-Match 'Included' 'Free unselected options should not be labeled Included'

$doodleCount = ([regex]::Matches($html, '<svg class="doodle')).Count
if ($doodleCount -lt 8) {
  $failures.Add("Expected at least 8 doodle SVGs; found $doodleCount")
}

$heartCount = ([regex]::Matches($html, '<svg class="doodle doodle-heart')).Count
if ($heartCount -lt 3) {
  $failures.Add("Expected at least 3 heart doodles; found $heartCount")
}

$cupCount = ([regex]::Matches($html, '<svg class="doodle doodle-cup')).Count
if ($cupCount -lt 3) {
  $failures.Add("Expected at least 3 cup doodles; found $cupCount")
}

$heroCount = ([regex]::Matches($html, 'croissant coffee and store front\.JPG')).Count
if ($heroCount -ne 1) {
  $failures.Add("Hero photo should appear once; found $heroCount")
}

if ($failures.Count) {
  $failures | ForEach-Object { Write-Error $_ }
  exit 1
}

Write-Output 'Site audit passed.'
