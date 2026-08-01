# Rehlaa UI Plan Alignment Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Align every Rehlaa architecture and implementation plan with the approved adaptive visual system extracted from `doc/ui.txt` without removing or changing product behavior.

**Architecture:** `doc/specs/2026-08-01-ui-design-system.md` is the single visual authority. Existing architecture, feature, data, navigation, localization, offline, and financial decisions remain authoritative in their current documents; each plan gains only the visual contract and feature-specific component requirements it needs.

**Tech Stack:** Markdown documentation, Flutter 3.44.x design guidance, Material 3 semantic themes, PowerShell validation, Git.

## Global Constraints

- `doc/ui.txt` remains an immutable source reference and is not rewritten.
- The approved palette, typography, shape, motion, component, accessibility, light/dark, and RTL/LTR rules come from `doc/specs/2026-08-01-ui-design-system.md`.
- Feature-first Clean MVVM, Riverpod, repository contracts, selective domain logic, and thin pages remain unchanged.
- No existing application feature, business rule, protected route, offline restriction, localization requirement, or test flow may be removed.
- The primary action color is semantic orange: light `#C94F22`, dark `#FF9A73`; purple is promotional only.
- English uses bundled Plus Jakarta; Arabic plans require bundled Cairo at weights 400, 500, and 700.
- All visible styling comes from tokens and typed design-system components.
- Interactive targets are at least 48×48 logical pixels.
- Visual deliverables support Arabic/English, RTL/LTR, light/dark, the three reference device sizes, and 200% text scaling.
- The aggregate implementation plan must stay synchronized with the individual plans.

---

### Task 1: Connect architecture documents to the visual authority

**Files:**
- Modify: `doc/Architecture.md`
- Modify: `doc/specs/2026-07-31-flutter-mobile-app-design.md`

**Interfaces:**
- Consumes: `doc/specs/2026-08-01-ui-design-system.md`.
- Produces: architecture-level visual boundaries and a single authoritative reference used by every feature plan.

- [ ] **Step 1: Record the expected missing references**

Run:

```powershell
Select-String -Path '.\doc\Architecture.md','.\doc\specs\2026-07-31-flutter-mobile-app-design.md' -SimpleMatch '2026-08-01-ui-design-system.md'
```

Expected before editing: neither file contains the approved specification path.

- [ ] **Step 2: Add the design-system decision to `Architecture.md`**

Add a section after Widget Reuse Strategy that states:

```markdown
## Visual Contract

All design-system tokens and visual component behavior follow
`doc/specs/2026-08-01-ui-design-system.md`. The `ui.txt` reference contributes
visual language only; it does not replace Rehlaa architecture, navigation,
state management, localization, or feature behavior.
```

Summarize the semantic palette, dual-theme rule, token-only feature styling, Plus Jakarta/Cairo typography, 48×48 targets, and directional layout rule.

- [ ] **Step 3: Expand sections 5 and 10 of the architecture/design specification**

Add the approved component taxonomy to Reusable Widget Strategy. Replace the generic Theming section with a concise reference plus exact semantic roles: `background`, `surface`, `surfaceMuted`, `primary`, `onPrimary`, `primaryContainer`, `brandDecorative`, `promotionalContainer`, `textPrimary`, `textSecondary`, `outline`, `success`, `warning`, and `error`.

- [ ] **Step 4: Validate architecture boundaries**

Run:

```powershell
Select-String -Path '.\doc\Architecture.md','.\doc\specs\2026-07-31-flutter-mobile-app-design.md' -SimpleMatch '2026-08-01-ui-design-system.md'
Select-String -Path '.\doc\Architecture.md','.\doc\specs\2026-07-31-flutter-mobile-app-design.md' -Pattern '(?i)Feature-first|Riverpod|RTL|dark|offline'
```

Expected: both files reference the UI specification and still retain the architectural constraints.

- [ ] **Step 5: Commit the architecture alignment**

```powershell
git add -- 'doc/Architecture.md' 'doc/specs/2026-07-31-flutter-mobile-app-design.md'
git commit -m "docs(architecture): adopt Rehlaa visual contract"
```

### Task 2: Rewrite the Foundation design-system tasks

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-foundation.md`

**Interfaces:**
- Consumes: semantic roles and component definitions from the approved UI specification.
- Produces: exact implementation requirements for Flutter tokens, fonts, themes, and foundational components.

- [ ] **Step 1: Prove the old primary-color assumption exists**

Run:

```powershell
$legacyPrimary = @('brand' + ' purple', '0xFF' + '8E007B', 'brandPrimary')
Select-String -Path '.\doc\plans\2026-07-31-flutter-foundation.md' -Pattern ($legacyPrimary -join '|')
```

Expected before editing: the plan defines purple as the primary action color.

- [ ] **Step 2: Replace Task 6 token requirements**

Require files for colors, spacing, radius, sizes, durations, shadows, and breakpoints. Define separate `AppLightColors` and `AppDarkColors` ThemeExtension values with the exact approved palette. Require `AppTheme.light()` and `AppTheme.dark()` to configure color scheme, text, buttons, fields, cards, app bars, bottom navigation, bottom sheets, focus, disabled, and selection states.

- [ ] **Step 3: Add typography and font registration requirements**

Require Plus Jakarta for Latin content and Cairo assets at 400/500/700 for Arabic. Add tests asserting the active locale selects the intended family and both text themes expose the approved scale.

- [ ] **Step 4: Expand Task 7 component deliverables**

Require these typed components and states:

```text
AppPrimaryButton, AppSecondaryButton, AppOutlinedButton
AppTextField, AppPasswordField, AppSearchField
AppIconButton, NotificationBadge
AppCard, AppSectionHeader
AppBottomSheet, AppModalHandle
AppBottomNavigation
AppLoadingIndicator, AppSkeleton, AppEmptyState, AppErrorState, AppOfflineBanner
```

Document default, pressed, focused, disabled, loading, selected, success, warning, and error behavior where applicable.

- [ ] **Step 5: Add Home vertical-slice visual acceptance**

Require `HomeHeader`, `PromoBanner`, `CategoryCard`, `AppSectionHeader`, and product sections to use the new components, 20-pixel page rhythm, directional spacing, and no raw values.

- [ ] **Step 6: Validate Foundation alignment**

Run:

```powershell
Select-String -Path '.\doc\plans\2026-07-31-flutter-foundation.md' -Pattern '0xFFC94F22|0xFFFF9A73|Plus Jakarta|Cairo|AppSearchField|AppBottomSheet|200%'
$legacyPrimary = @('brand' + ' purple', '0xFF' + '8E007B')
Select-String -Path '.\doc\plans\2026-07-31-flutter-foundation.md' -Pattern ($legacyPrimary -join '|')
```

Expected: all approved terms are present; the second command returns no matches.

- [ ] **Step 7: Commit Foundation plan updates**

```powershell
git add -- 'doc/plans/2026-07-31-flutter-foundation.md'
git commit -m "docs(ui): align foundation plan with adaptive themes"
```

### Task 3: Align authentication screens with the component language

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-authentication.md`

**Interfaces:**
- Consumes: `AppTextField`, `AppPasswordField`, button variants, typography, and directional-value rules.
- Produces: visually consistent login, registration, verification, forgot-password, and reset-password tasks.

- [ ] **Step 1: Add a Visual Contract subsection**

Reference the approved UI specification and require flat app bars, centered 24/700 headings, concise supporting copy, radius-28 form fields, 52-pixel primary actions, and Google sign-in as secondary action.

- [ ] **Step 2: Expand Task 5 widget deliverables**

Require `AuthPageLayout`, `AuthHeader`, `AuthFormCard`, `GoogleSignInButton`, `OtpField`, and `AuthFooterLink`. Specify keyboard-safe scrolling, localized semantics, LTR technical fields in Arabic, and theme-correct focus/error states.

- [ ] **Step 3: Expand authentication widget tests**

Add light-English, dark-Arabic, 360×800, keyboard-open, 200%-text, disabled/loading button, and field error/focus assertions.

- [ ] **Step 4: Validate and commit**

```powershell
Select-String -Path '.\doc\plans\2026-07-31-flutter-authentication.md' -Pattern '2026-08-01-ui-design-system|radius 28|dark-Arabic|200%|GoogleSignInButton'
git add -- 'doc/plans/2026-07-31-flutter-authentication.md'
git commit -m "docs(auth): apply Rehlaa form design language"
```

### Task 4: Align catalog, Home, product details, favorites, and cart

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-catalog-commerce.md`

**Interfaces:**
- Consumes: `ProductCard`, `CategoryCard`, `PromoBanner`, `AppSectionHeader`, `AppIconButton`, and layered details-surface rules.
- Produces: commerce screen tasks matching the extracted reference rhythm while retaining Rehlaa data and domain rules.

- [ ] **Step 1: Add the commerce visual contract**

Document the Home sequence: search/actions, promotional banner, categories, exclusive offers, product sections, then scoped offline/empty/error states.

- [ ] **Step 2: Specify ProductCard variants**

Define square muted media, radius 12, two-line title, current and compare-at prices, optional status badge, 48-pixel favorite target, and typed `compact`, `grid`, and `horizontal` variants.

- [ ] **Step 3: Specify product-details composition**

Require `ProductMediaGallery`, `ProductDetailsSurface`, `FavoriteButton`, `ProductRating`, option selectors, quantity selector, price, and safe-area sticky purchase action. Use `surfaceMuted` for media and radius 40 for layered content surfaces.

- [ ] **Step 4: Specify cart composition**

Use the horizontal ProductCard language, directional swipe/delete behavior, and a radius-30 sticky `CartSummaryBar`. Preserve product-option identity and all Money rules.

- [ ] **Step 5: Add visual test cases and commit**

```powershell
Select-String -Path '.\doc\plans\2026-07-31-flutter-catalog-commerce.md' -Pattern 'PromoBanner|CategoryCard|ProductDetailsSurface|radius 40|CartSummaryBar|200%'
git add -- 'doc/plans/2026-07-31-flutter-catalog-commerce.md'
git commit -m "docs(catalog): align commerce screens with UI reference"
```

### Task 5: Align checkout and wallet financial surfaces

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-checkout-payments.md`
- Modify: `doc/plans/2026-07-31-flutter-wallet.md`

**Interfaces:**
- Consumes: `AppBottomSheet`, financial card, status badge, fields, selectors, and semantic transaction-color rules.
- Produces: consistent checkout and wallet presentation without moving financial calculations into UI.

- [ ] **Step 1: Define checkout visual composition**

Require a radius-30, keyboard-safe sheet with modal handle, grouped `AppCard` sections, sticky action region, typed payment tiles, clear selection states, and theme-correct receipt upload.

- [ ] **Step 2: Define wallet visual composition**

Require `WalletBalanceCard` using promotional semantic roles, `ChargeWalletTile`, `WalletStatusBadge`, quick-amount selectors, and transaction tiles that show icon, sign, and label in addition to color.

- [ ] **Step 3: Add financial accessibility tests**

Cover hidden balance semantics, offline-disabled actions, pending/success/error status distinction, dark-mode bank details, 200% text, and keyboard-open transfer forms.

- [ ] **Step 4: Validate and commit**

```powershell
Select-String -Path '.\doc\plans\2026-07-31-flutter-checkout-payments.md','.\doc\plans\2026-07-31-flutter-wallet.md' -Pattern '2026-08-01-ui-design-system|radius-30|promotional|icon, sign, and label|200%'
git add -- 'doc/plans/2026-07-31-flutter-checkout-payments.md' 'doc/plans/2026-07-31-flutter-wallet.md'
git commit -m "docs(finance): unify checkout and wallet visual surfaces"
```

### Task 6: Align profile, settings, and Phase 2 screens

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-profile-settings.md`
- Modify: `doc/plans/2026-07-31-flutter-phase-2-features.md`

**Interfaces:**
- Consumes: avatar, grouped menu tile, badge, search, status, filter sheet, empty state, and content-card patterns.
- Produces: one visual language for account and expansion features.

- [ ] **Step 1: Specify profile and settings patterns**

Require circular avatar with 48-pixel edit action, `UserSummaryCard`, `ProfileStatsGrid`, `SettingsGroup`, muted `SettingsTile`, directional arrows, radio selection cards, and destructive `LogoutTile` with confirmation sheet.

- [ ] **Step 2: Specify Phase 2 reuse**

Map Orders to `AppCard` + `AppStatusBadge`, Notifications to grouped interactive tiles + badge, Search to `AppSearchField`, Filters to `AppBottomSheet`, and support/policy content to readable `AppCard`/typography surfaces.

- [ ] **Step 3: Add theme, directionality, and scaling tests**

Require dark Arabic and light English for profile, order details, notifications, filters, and content pages; include 200% text and 48-pixel control checks.

- [ ] **Step 4: Validate and commit**

```powershell
Select-String -Path '.\doc\plans\2026-07-31-flutter-profile-settings.md','.\doc\plans\2026-07-31-flutter-phase-2-features.md' -Pattern '2026-08-01-ui-design-system|SettingsGroup|AppStatusBadge|AppSearchField|AppBottomSheet|200%'
git add -- 'doc/plans/2026-07-31-flutter-profile-settings.md' 'doc/plans/2026-07-31-flutter-phase-2-features.md'
git commit -m "docs(features): unify profile and phase two UI patterns"
```

### Task 7: Strengthen visual quality gates

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-quality-release.md`

**Interfaces:**
- Consumes: all UI specification acceptance criteria.
- Produces: automated and manual evidence that the adaptive system works across themes, locales, sizes, and states.

- [ ] **Step 1: Expand the shared test harness**

Require theme/locale/device/text-scale parameters, deterministic fonts and assets, disabled animations for goldens, and helpers for 360×800, 390×844, and 412×915.

- [ ] **Step 2: Expand golden coverage**

Require Home, authentication, product details, cart, checkout, wallet, profile, orders, notifications, and empty/error/offline states in the meaningful light/dark and Arabic/English combinations.

- [ ] **Step 3: Add semantic design-token assertions**

Require tests for exact light/dark palette roles, primary foreground contrast, minimum 48×48 targets, focus visibility, color-independent financial/status meaning, and no raw visual values in feature code where lintable.

- [ ] **Step 4: Expand accessibility checks**

Require WCAG AA text contrast, 3:1 non-text contrast, localized semantics, RTL directional order, and 200% text scaling across primary pages.

- [ ] **Step 5: Validate and commit**

```powershell
Select-String -Path '.\doc\plans\2026-07-31-flutter-quality-release.md' -Pattern 'WCAG|4.5:1|3:1|48×48|200%|360×800|412×915'
git add -- 'doc/plans/2026-07-31-flutter-quality-release.md'
git commit -m "docs(quality): enforce adaptive visual acceptance gates"
```

### Task 8: Update the master roadmap and global constraints

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-mobile-app-master-roadmap.md`

**Interfaces:**
- Consumes: approved UI specification and all updated feature plans.
- Produces: an execution order and definition of done that treats the visual system as a cross-cutting dependency.

- [ ] **Step 1: Add the UI specification to global constraints**

State that the visual authority is `doc/specs/2026-08-01-ui-design-system.md`, the source is `ui.txt`, orange is primary, purple is promotional, and every UI deliverable covers both themes and directions.

- [ ] **Step 2: Update the first implementation phase**

Order it as semantic color roles, typography/fonts, spacing/shape/motion, themed components, localization/directionality, navigation, feedback states, then Home proof slice.

- [ ] **Step 3: Expand the definition of done**

Add token-only feature styling, component-state coverage, three device sizes, WCAG checks, 48-pixel targets, 200% text, and synchronized aggregate plan.

- [ ] **Step 4: Validate and commit**

```powershell
Select-String -Path '.\doc\plans\2026-07-31-flutter-mobile-app-master-roadmap.md' -Pattern '2026-08-01-ui-design-system|orange|promotional|200%|WCAG|48'
git add -- 'doc/plans/2026-07-31-flutter-mobile-app-master-roadmap.md'
git commit -m "docs(roadmap): make UI system a global dependency"
```

### Task 9: Synchronize the complete aggregate implementation plan

**Files:**
- Modify: `doc/plans/2026-07-31-flutter-mobile-app-complete-implementation-plan.md`

**Interfaces:**
- Consumes: the updated roadmap and eight individual implementation plans.
- Produces: one aggregate plan containing the same visual decisions and no obsolete primary-color requirements.

- [ ] **Step 1: Add an aggregate-source manifest**

List the roadmap, Foundation, Authentication, Catalog, Checkout, Wallet, Profile, Phase 2, Quality, and UI alignment plan as its authoritative sources. State that individual plans win if a future synchronization mismatch is found.

- [ ] **Step 2: Update every UI-related aggregate section**

Mirror the approved contract, Foundation token definitions, feature-specific component requirements, and quality gates from Tasks 2–7. Do not change domain interfaces, method signatures, feature ordering, or test flow descriptions.

- [ ] **Step 3: Remove obsolete visual requirements**

Remove purple-primary wording and the `#8E007B` token while preserving promotional purple. Ensure exact light/dark primary values and the Plus Jakarta/Cairo rule appear once in global constraints and are referenced consistently thereafter.

- [ ] **Step 4: Validate synchronization**

Run:

```powershell
$aggregate = '.\doc\plans\2026-07-31-flutter-mobile-app-complete-implementation-plan.md'
Select-String -Path $aggregate -Pattern '2026-08-01-ui-design-system|0xFFC94F22|0xFFFF9A73|Plus Jakarta|Cairo|WCAG|200%'
$legacyPrimary = @('brand' + ' purple', '0xFF' + '8E007B')
Select-String -Path $aggregate -Pattern ($legacyPrimary -join '|')
```

Expected: all approved markers exist; obsolete markers return no matches.

- [ ] **Step 5: Commit the aggregate synchronization**

```powershell
git add -- 'doc/plans/2026-07-31-flutter-mobile-app-complete-implementation-plan.md'
git commit -m "docs(plan): synchronize complete plan with UI system"
```

### Task 10: Audit the complete `doc/` plan set

**Files:**
- Verify: `doc/Architecture.md`
- Verify: `doc/specs/*.md`
- Verify: `doc/plans/*.md`
- Preserve unchanged: `doc/ui.txt`

**Interfaces:**
- Consumes: all updated documents.
- Produces: evidence that the plan set is consistent, complete, and preserves the application concept.

- [ ] **Step 1: Scan for placeholders and obsolete colors**

```powershell
$markdown = Get-ChildItem '.\doc' -Recurse -File -Filter '*.md'
$incomplete = @('T' + 'BD', 'T' + 'ODO', 'implement' + ' later', 'fill in' + ' details')
$legacyPrimary = @('brand' + ' purple', '0xFF' + '8E007B')
$markdown | Select-String -Pattern ($incomplete -join '|')
$markdown | Select-String -Pattern ($legacyPrimary -join '|')
```

Expected: no matches.

- [ ] **Step 2: Verify UI contract coverage**

```powershell
Get-ChildItem '.\doc\plans' -File -Filter '*.md' | ForEach-Object {
  if (-not (Select-String -Path $_.FullName -SimpleMatch '2026-08-01-ui-design-system.md' -Quiet)) {
    Write-Output "Missing UI contract: $($_.Name)"
  }
}
```

Expected: no missing plan.

- [ ] **Step 3: Verify preserved product concepts**

```powershell
$plans = Get-ChildItem '.\doc\plans' -File -Filter '*.md'
$plans | Select-String -Pattern 'Authentication|Catalog|Checkout|Wallet|Profile|Orders|Notifications|Search|Offline|Arabic|English|Riverpod'
```

Expected: the original feature and architectural vocabulary remains represented.

- [ ] **Step 4: Verify formatting and inspect the final diff**

```powershell
git diff --check -- 'doc'
git diff --stat -- 'doc'
git diff -- 'doc'
```

Expected: no whitespace errors, no `ui.txt` changes, and only intentional documentation edits.

- [ ] **Step 5: Commit any audit-only corrections**

```powershell
git add -- 'doc/Architecture.md' 'doc/specs' 'doc/plans'
git commit -m "docs(ui): finalize plan-wide design consistency"
```
