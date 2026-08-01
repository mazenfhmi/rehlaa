# Rehlaa UI Design System Specification

**Date:** 2026-08-01  
**Status:** Approved design direction  
**Source reference:** `doc/ui.txt`  
**Scope:** Visual language, reusable components, and screen-composition rules for the Rehlaa Flutter application.

## 1. Purpose

This specification extracts the visual language demonstrated by `ui.txt` and adapts it to Rehlaa without changing the application's product scope, architecture, business rules, navigation branches, localization, offline policy, or payment and wallet behavior.

The reference is used as a visual source, not as an architectural template. Rehlaa keeps Feature-first Clean MVVM, Riverpod, repository contracts, reusable design-system widgets, Arabic/English localization, and light/dark themes.

## 2. Extracted Reference Style

The reference uses a friendly, lightweight commerce style built from:

- A warm orange accent and a pale orange container color.
- White pages and muted gray content surfaces.
- Flat app bars and restrained shadows.
- Rounded buttons, fields, cards, banners, and circular icon actions.
- A default 20 logical-pixel page gutter.
- Compact product cards with a square media area, two-line title, accent price, and circular favorite action.
- Category shortcuts with 56×56 icon containers.
- Search and quick actions grouped in the Home header.
- Horizontal sections for promotions and popular products.
- Large rounded top surfaces in product details and bottom summaries.
- A simple icon-led bottom navigation.
- Short 200–250ms transitions.

The following reference implementation details are intentionally not carried into Rehlaa:

- Stateful business logic embedded directly in widgets.
- Hard-coded user-facing text.
- Fixed left/right positioning that breaks RTL.
- Light-only color assumptions.
- Low-contrast gray text and orange buttons with white text.
- Named-route and folder structures from the reference project.
- Feature behavior, product data, and navigation destinations that conflict with the Rehlaa plan.

## 3. Design Principles

1. **Warm and approachable:** Orange communicates primary actions and active states.
2. **Content first:** Products, services, balances, and order information remain visually dominant.
3. **Soft structure:** Muted surfaces, rounded geometry, and light borders create hierarchy without heavy shadows.
4. **Semantic color roles:** Widgets request roles such as `primary`, `surface`, and `error`; they do not select raw colors.
5. **Native light and dark themes:** Dark mode is designed separately rather than produced by mechanically inverting light colors.
6. **Accessible interaction:** Text contrast, state distinction, semantics, focus, and minimum target sizes are required.
7. **Bidirectional by default:** Geometry and icons use directional Flutter APIs and behave correctly in Arabic and English.
8. **Token-only styling:** Feature code does not introduce raw spacing, color, typography, radius, shadow, or duration values.

## 4. Color System

### 4.1 Semantic palette

| Role | Light | Dark | Usage |
| --- | --- | --- | --- |
| `background` | `#FFFFFF` | `#121318` | Page background |
| `surface` | `#FFFFFF` | `#1C1E24` | Cards, sheets, app bars |
| `surfaceMuted` | `#F5F6F9` | `#252832` | Search fields, media wells, grouped tiles |
| `primary` | `#C94F22` | `#FF9A73` | Primary buttons, active controls, links |
| `onPrimary` | `#FFFFFF` | `#24120B` | Content placed on `primary` |
| `primaryContainer` | `#FFECDF` | `#3D241C` | Category icons, soft selected states |
| `onPrimaryContainer` | `#7A2D12` | `#FFD8C8` | Content on `primaryContainer` |
| `brandDecorative` | `#FF7643` | `#FF8A5C` | Decorative identity, indicators, gradients |
| `promotional` | `#4A3298` | `#C2B7FF` | Promotional identity and special offers |
| `promotionalContainer` | `#4A3298` | `#2F285A` | Promotional banners |
| `onPromotionalContainer` | `#FFFFFF` | `#EDE9FF` | Text on promotional banners |
| `textPrimary` | `#1F1F23` | `#F7F7F8` | Main text |
| `textSecondary` | `#6B6B73` | `#B7BAC2` | Supporting text |
| `outline` | `#E3E5EA` | `#343843` | Borders and dividers |
| `success` | `#1F8F5F` | `#4CD391` | Completed and positive states |
| `warning` | `#B76E00` | `#FFC857` | Pending and warning states |
| `error` | `#D92D3A` | `#FF737D` | Errors and destructive states |
| `scrim` | `#99000000` | `#B3000000` | Modal and image overlays |

### 4.2 Color rules

- Light primary buttons use `primary` with `onPrimary`.
- Dark primary buttons use the lighter `primary` with dark `onPrimary` text.
- `brandDecorative` preserves the source orange but is not used behind small white text.
- `promotional` is secondary to orange and is reserved for banners, exclusive offers, and selected promotional badges.
- Favorite state uses the theme error family; it must not create a second unrelated red palette.
- Disabled colors are derived through the theme with sufficient visual distinction; feature widgets do not apply arbitrary opacity.
- Monetary positive/negative colors are never the only indication of direction; sign, label, and icon are also present.

## 5. Typography

### 5.1 Font families

- English and Latin content use the bundled `Plus Jakarta` family.
- Arabic content uses a bundled `Cairo` family with matching 400, 500, and 700 weights.
- Numeric identifiers, account numbers, coupon codes, emails, and operation numbers remain LTR but inherit the active visual family where glyph support allows.
- Flutter platform fallback is allowed only for unsupported symbols, not as the intended Arabic typography strategy.

### 5.2 Type scale

| Token | Size / weight / height | Usage |
| --- | --- | --- |
| `displayLarge` | 32 / 700 / 1.25 | Onboarding brand and major success state |
| `headlineLarge` | 24 / 700 / 1.35 | Page title and authentication heading |
| `headlineMedium` | 20 / 700 / 1.35 | Major card and details heading |
| `titleMedium` | 16 / 600 / 1.40 | Section title and list title |
| `bodyLarge` | 16 / 400 / 1.50 | Primary body and form content |
| `bodyMedium` | 14 / 400 / 1.45 | Supporting text and product names |
| `labelLarge` | 14 / 600 / 1.20 | Buttons, price, and important actions |
| `labelSmall` | 12 / 500 / 1.25 | Badge, caption, and navigation label |

Text scaling to 200% must not hide actions, clip content, or cause unscrollable overflow.

## 6. Layout and Shape Tokens

### 6.1 Spacing

The spacing scale is `4, 8, 12, 16, 20, 24, 32, 40` logical pixels.

- Standard page gutter: 20.
- Compact grid gutter: 16 when needed to preserve a usable two-column layout at 360 logical pixels.
- Section separation: 20 or 24.
- Card internal padding: 16 or 20.
- Inline icon/text gap: 8 or 12.

All horizontal geometry uses `EdgeInsetsDirectional`, `AlignmentDirectional`, and directional positioning.

### 6.2 Radius

| Token | Value | Usage |
| --- | ---: | --- |
| `small` | 10 | Thumbnails and compact icon containers |
| `medium` | 12 | Search field and product media |
| `large` | 16 | Buttons, form fields, cards |
| `xLarge` | 20 | Banners and promotional cards |
| `sheet` | 30 | Bottom sheets and sticky summaries |
| `detailsSurface` | 40 | Layered product-details surfaces |
| `pill` | 999 | Chips, status badges, circular actions |

### 6.3 Sizes and motion

- Minimum interactive target: 48×48.
- Primary button height: 52.
- Standard icon action: 46×46.
- Category icon container: 56×56.
- Product thumbnail: square or a documented responsive aspect ratio.
- Quick transition: 200ms.
- Standard transition: 250ms.
- Reduced-motion mode removes nonessential movement while preserving state feedback.

## 7. Elevation and Surfaces

- Borders and surface color changes provide the default separation.
- Cards use no shadow or a single low-elevation token.
- Floating circular actions may use a soft shadow matching the reference.
- Sticky checkout and summary regions may use a subtle upward shadow.
- Dark surfaces are separated through `surface`, `surfaceMuted`, and `outline`, not gray shadows.
- Promotional images always include a contrast overlay when text is placed on them.

## 8. Foundational Components

### 8.1 Buttons

`AppPrimaryButton` is full width by default, 52 pixels high, radius 16, and supports leading icon, loading, disabled, success, and error recovery states.

`AppSecondaryButton` uses `primaryContainer` or a neutral surface. `AppOutlinedButton` uses `outline` and theme foreground. Destructive actions use the error role and require confirmation where data or sessions are affected.

### 8.2 Fields

`AppTextField` follows the reference's rounded form language with radius 28, floating or persistent label, optional prefix/suffix, helper/error text, and visible focus state.

`AppPasswordField` adds localized visibility semantics. `AppSearchField` uses `surfaceMuted`, radius 12, no default outline, and a visible focus treatment. Email, phone, money, coupon, account, and operation-number inputs set direction and keyboard behavior explicitly.

### 8.3 Icon actions and badges

`AppIconButton` uses a 46×46 circular or rounded container. `NotificationBadge` is positioned directionally, supports 1–99 and `99+`, and exposes the combined semantic label. Icon-only controls always have localized tooltips and semantics.

### 8.4 Cards and lists

`AppCard` uses a theme surface, radius 16, and a light border. Typed variants cover plain, interactive, selected, promotional, and financial cards without duplicating widgets.

List tiles use a minimum 56-pixel visual height, directional leading/trailing slots, and a 48-pixel interaction target.

### 8.5 Navigation and overlays

`AppBottomNavigation` retains Rehlaa's five branches: Home, Favorites, Cart, Wallet, and Profile. Active icons use `primary`; inactive icons use `textSecondary`. Labels remain available to semantics and become visibly available when accessibility settings, width, or platform conventions require them.

`AppBottomSheet` has radius 30 on its top corners, a visible modal handle, keyboard-safe scrolling, a bounded maximum height, and an optional sticky action region.

## 9. Commerce and Shared Components

### 9.1 Product card

`ProductCard` adapts the reference as follows:

- Square media area on `surfaceMuted`, radius 12.
- Product name limited to two lines in the default grid variant.
- Localized current price with 600–700 weight.
- Optional compare-at price with semantic strikethrough.
- Optional featured, stock, or discount badge.
- Favorite action in a 48-pixel target with a 24-pixel visual container.
- Typed `compact`, `grid`, and `horizontal` variants.
- No provider reads or pricing calculations.

### 9.2 Category card

`CategoryCard` uses a 56×56 `primaryContainer` icon well with radius 10 and a short centered label. It supports horizontal scrolling when localized labels do not fit safely.

### 9.3 Promotional banner

`PromoBanner` uses radius 20 and either `promotionalContainer` or a media image with a scrim. Copy uses no more than one eyebrow line, a two-line heading, and one action. Banner content remains merchant/mock-data driven.

### 9.4 Section header

`AppSectionHeader` combines a 16/600 directional title and an optional localized secondary action. It does not hard-code “See more”.

### 9.5 Price and status

`AppPriceText`, `ProductPrice`, `PriceSummary`, and `AppStatusBadge` consume formatted or typed values. Money is never represented as `double`. Status variants map to semantic roles and always include text.

## 10. Screen Composition

### 10.1 Home

Home follows the reference rhythm while preserving Rehlaa content:

1. Search field with Cart and Notifications actions.
2. Promotional or campaign banner.
3. Service category shortcuts.
4. Special/exclusive offers.
5. Featured or popular digital services.
6. Offline and empty/error states at the relevant section boundary.

The page remains a thin composition of feature widgets and contains no raw styling.

### 10.2 Authentication

Authentication pages use a flat app bar, centered 24-pixel heading, concise support copy, rounded fields, full-width primary action, and Google sign-in as a secondary action. Forms scroll above the keyboard and preserve LTR for email and technical values in Arabic mode.

### 10.3 Product details

The media gallery sits on `surfaceMuted`. Product content appears in layered surfaces with 40-pixel top corners. Favorite, rating, options, quantity, description, and price use reusable components. A safe-area-aware sticky primary action remains visible without covering content.

### 10.4 Cart and checkout

Cart items use the horizontal product-card language. Coupon/referral, wallet allocation, payment method, bank details, and receipt upload are composed in a radius-30 sheet or sticky summary surface. Financial state remains owned by domain and ViewModel layers.

### 10.5 Wallet

The balance uses a promotional financial card derived from the same palette. Visibility, status, top-up, quick amounts, and transaction history retain the existing product behavior. Positive and negative transactions use icon, sign, and label in addition to color.

### 10.6 Profile and settings

Profile uses a circular avatar and a small edit action. Menu groups use muted interactive tiles inspired by the reference profile menu, with directional arrows and orange active/icon accents. Logout remains visually destructive and requires confirmation.

### 10.7 Phase 2 features

Orders, notifications, search/filter, support, policy, and informational pages reuse the same cards, search fields, badges, section headers, empty states, and bottom sheets. They must not introduce a separate visual language.

## 11. States and Accessibility

Every reusable interactive component defines default, pressed, focused, hovered where applicable, disabled, loading, selected, success, warning, and error behavior.

- Touch targets are at least 48×48 logical pixels.
- Normal text targets WCAG AA contrast of 4.5:1; large text and non-text controls target at least 3:1.
- Focus indicators remain visible in both themes.
- Color is never the only state signal.
- Decorative images are excluded from semantics; informative images have localized labels.
- RTL changes layout direction but not the meaning of media playback, technical identifiers, or required platform icons.
- Screens support 360×800, 390×844, and 412×915 reference sizes without overflow.
- Core screens are verified at 200% text scaling.

## 12. Architecture Boundaries

The visual adaptation does not change these accepted decisions:

- Feature-first Clean MVVM and selective domain layer.
- Riverpod Notifier/AsyncNotifier and provider overrides.
- Mock repositories now and API repositories later.
- Android and iOS first-release targets.
- Arabic/English and runtime light/dark switching.
- Guest browsing and protected actions.
- Read-only offline cache and blocked financial operations offline.
- Integer minor units for money.
- Thin pages, reusable widgets, and no business logic in UI.

The reference code is never copied as-is. Its visual patterns are rebuilt through Rehlaa tokens and typed components.

## 13. Documentation Update Contract

All implementation plans in `doc/plans/` must:

- Reference this specification as the authoritative visual contract.
- Replace the existing purple-primary assumption with the semantic light/dark palette.
- Add explicit component variants and state requirements where a UI task is defined.
- Name the Rehlaa design-system components used by each screen task.
- Require RTL/LTR, light/dark, accessibility, and text-scale verification for visual deliverables.
- Preserve every existing feature, domain rule, repository boundary, navigation decision, and test flow.
- Keep the complete aggregate implementation plan synchronized with the individual plans.

`doc/ui.txt` remains an immutable source reference and is not rewritten.

## 14. Acceptance Criteria

The documentation update is complete when:

- The architecture specification references this UI contract.
- Foundation tasks define the approved tokens, typography, themes, shape, motion, and foundational widgets.
- Every feature plan describes its screens using the approved reusable components.
- The master roadmap lists the UI contract as a global constraint and implementation dependency.
- The aggregate plan matches the updated individual plans.
- Quality tasks include theme, directionality, contrast, semantics, target-size, and 200% text-scale checks.
- No document still defines purple as the primary brand action color.
- No product feature or business rule from the existing plan is removed.
