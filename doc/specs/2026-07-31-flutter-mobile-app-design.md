# Flutter Mobile Application — Architecture & Design Specification

**Date:** 2026-07-31  
**Scope:** Mobile application only  
**Platforms:** Android and iOS  
**Implementation status:** Backend is not available yet; the first implementation uses mock data behind repository contracts.

## 1. Product Scope

The application reproduces the supplied marketplace interfaces while correcting obvious usability and consistency issues rather than copying visible defects literally.

### Phase 1 screens

- Authentication: sign in, sign up, email verification, forgot password, reset password, logout.
- Guest browsing with authentication required for protected actions.
- Home.
- Product details and required option selection.
- Favorites.
- Empty and populated cart foundations.
- Checkout and payment-method selection.
- Wallet dashboard, transactions, and wallet top-up.
- Profile, account editing, language, theme, and notification preferences.

### Phase 2 screens

- Orders and order details.
- Notifications center.
- Advanced search and filters.
- Support, contact, privacy, about, and related informational pages.

## 2. Accepted Product Decisions

- Flutter is the only client technology.
- Android and iOS are supported from the first release.
- Arabic and English are supported from the first release with complete RTL/LTR behavior.
- Riverpod is used for dependency injection and state management.
- Products, categories, settings, and other non-sensitive read data may be cached locally.
- Ordering, wallet operations, and payments are blocked while offline.
- Authentication supports email/password and Google. Apple sign-in is excluded from the first release.
- Backend integration will be added later without changing pages or feature-facing ViewModels.
- The visual design should remain close to the supplied screens while fixing duplicated fields, inconsistent text direction, grammar, and money formatting.
- `doc/specs/2026-08-01-ui-design-system.md` is the authoritative visual contract extracted from `doc/ui.txt` and adapted for native Light/Dark and RTL/LTR behavior.
- Orange is the primary interaction identity; purple is reserved for promotional content.
- The implementation state and stabilization priorities are tracked in `doc/2026-08-01-project-audit.md` and do not change the accepted product scope.

## 3. Architecture

The project uses a feature-first Clean MVVM architecture with a selective domain layer.

```text
Widget / Page
     ↓
Riverpod ViewModel
     ↓
Use Case when business logic is complex or shared
     ↓
Repository Interface
     ↓
Mock Repository now / API Repository later
     ↓
Mock, Local, or Remote Data Source
```

### 3.1 Presentation layer

Contains pages, reusable feature widgets, ViewModels, immutable UI state, form controllers, and presentation formatting.

Pages must remain thin. They compose widgets and bind user actions to ViewModel methods. Pages must not parse JSON, calculate checkout totals, access storage directly, or implement payment and wallet rules.

### 3.2 Domain layer

Contains entities, repository contracts, value objects, and selective use cases.

Use cases are created only where they provide clear value, including:

- Resolving required product options and selected variants.
- Producing checkout quotes.
- Applying coupon and referral rules.
- Allocating wallet balance to an order.
- Creating wallet top-ups.
- Submitting bank-transfer evidence.
- Authentication flows that coordinate several repositories or services.

Simple repository calls do not require one-class-per-action use cases.

### 3.3 Data layer

Contains DTOs, mappers, repository implementations, mock data sources, local cache data sources, and future remote data sources.

Domain entities never depend on JSON or transport-specific field names. DTO-to-entity conversion is isolated in mappers.

## 4. Project Structure

```text
lib/
├── main.dart
├── bootstrap/
│   ├── bootstrap.dart
│   ├── app_environment.dart
│   ├── app_flavor.dart
│   └── provider_observer.dart
├── app/
│   ├── app.dart
│   ├── app_startup.dart
│   ├── app_shell.dart
│   └── app_dependencies.dart
├── core/
│   ├── config/
│   ├── constants/
│   ├── design_system/
│   ├── errors/
│   ├── extensions/
│   ├── localization/
│   ├── logging/
│   ├── navigation/
│   ├── network/
│   ├── result/
│   ├── storage/
│   ├── utils/
│   └── validation/
├── features/
│   ├── authentication/
│   ├── home/
│   ├── catalog/
│   ├── product_details/
│   ├── favorites/
│   ├── cart/
│   ├── checkout/
│   ├── wallet/
│   ├── profile/
│   ├── settings/
│   ├── notifications/
│   ├── orders/
│   ├── search/
│   └── support/
├── shared/
│   ├── domain/
│   └── presentation/
├── l10n/
│   ├── app_ar.arb
│   └── app_en.arb
└── generated/
```

Each feature follows this template:

```text
feature_name/
├── data/
│   ├── data_sources/
│   ├── dto/
│   ├── mappers/
│   ├── mock/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   ├── use_cases/
│   └── value_objects/
└── presentation/
    ├── pages/
    ├── states/
    ├── view_models/
    └── widgets/
```

## 5. Reusable Widget Strategy

Every page is assembled from reusable widgets at three levels.

### 5.1 Design-system widgets

Global visual components with no feature-specific business logic:

- `AppScaffold`
- `AppPageHeader`
- `AppBottomNavigation`
- `AppPrimaryButton`
- `AppSecondaryButton`
- `AppOutlinedButton`
- `AppIconButton`
- `AppTextField`
- `AppPasswordField`
- `AppSearchField`
- `AppCard`
- `AppGradientCard`
- `AppBadge`
- `AppStatusBadge`
- `AppSectionHeader`
- `AppBottomSheet`
- `AppModalHandle`
- `AppLoadingIndicator`
- `AppSkeleton`
- `AppEmptyState`
- `AppErrorState`
- `AppOfflineBanner`
- `AppNetworkImage`
- `AppPriceText`
- `AppCurrencyText`
- `AppResponsivePadding`
- `AppAsyncValueBuilder`

### 5.2 Shared business widgets

Components used by two or more features:

- `ProductCard`
- `ProductHorizontalCard`
- `ProductPrice`
- `ProductRating`
- `FavoriteButton`
- `PaymentMethodTile`
- `BankSelectorTile`
- `BankDetailsCard`
- `ReceiptUploader`
- `PriceSummary`
- `ApplyCodeField`
- `UserAvatar`
- `NotificationBadge`

### 5.3 Feature-local widgets

Widgets remain inside a feature until they are genuinely reused by another feature. A component is not moved to `shared` merely because it might be reused later.

### 5.4 Composition rule

```text
Page = layout + feature widgets
Feature widget = design-system components + feature data
Design-system widget = visual behavior only
```

## 6. State Management and Dependency Injection

Riverpod is used with generated providers.

- `Notifier` for synchronous mutable state.
- `AsyncNotifier` for asynchronous feature state.
- Plain providers for repositories, services, formatters, and derived values.
- Provider overrides for tests, previews, and switching from mock to API implementations.
- Immutable feature state with explicit loading, success, empty, offline, and error cases.

Views never instantiate repositories directly.

## 7. Repository Switching Strategy

Repository contracts live in the domain layer. The initial provider returns a mock implementation:

```text
Repository contract
├── MockRepository — current implementation
└── ApiRepository — future implementation
```

When the backend becomes available, dependency bindings change from mock to API implementations. Pages, feature widgets, domain entities, and presentation-facing ViewModel APIs remain unchanged.

## 8. Navigation

Use `go_router` with a shell route for the main bottom navigation.

Main branches:

- Home.
- Favorites.
- Cart.
- Wallet.
- Profile.

Standalone routes:

- Authentication screens.
- Product details.
- Checkout.
- Account editing.
- Wallet top-up and bank-transfer review submission.

Protected routes and actions include favorites, wallet, checkout, orders, notifications, and profile editing. Guest users are redirected to authentication and returned to the intended destination after success.

## 9. Localization and Directionality

Use Flutter localization generation with ARB files.

- No user-visible text is hard-coded inside widgets.
- Arabic and English share semantic translation keys.
- Layout uses directional properties such as `EdgeInsetsDirectional` and `AlignmentDirectional`.
- Emails, operation numbers, account numbers, coupon codes, and technical identifiers remain LTR inside Arabic layouts.
- Dates, pluralization, and currency labels are localized centrally.

## 10. Theming and Design Tokens

The design system is token-driven and follows
`doc/specs/2026-08-01-ui-design-system.md`. `doc/ui.txt` is an immutable visual
source, not an implementation architecture.

```text
core/design_system/
├── tokens/
│   ├── app_colors.dart
│   ├── app_spacing.dart
│   ├── app_radius.dart
│   ├── app_sizes.dart
│   ├── app_durations.dart
│   ├── app_shadows.dart
│   └── app_breakpoints.dart
├── theme/
│   ├── app_theme.dart
│   ├── light_theme.dart
│   ├── dark_theme.dart
│   ├── app_text_theme.dart
│   ├── app_button_theme.dart
│   └── app_input_theme.dart
└── components/
```

Pages and feature widgets must not introduce raw color, radius, spacing, typography, or animation values unless the design system has no suitable token and the value is subsequently added to it.

The required semantic color roles are:

| Role | Light | Dark |
| --- | --- | --- |
| `background` | `#FFFFFF` | `#121318` |
| `surface` | `#FFFFFF` | `#1C1E24` |
| `surfaceMuted` | `#F5F6F9` | `#252832` |
| `primary` | `#C94F22` | `#FF9A73` |
| `onPrimary` | `#FFFFFF` | `#24120B` |
| `primaryContainer` | `#FFECDF` | `#3D241C` |
| `brandDecorative` | `#FF7643` | `#FF8A5C` |
| `promotionalContainer` | `#4A3298` | `#2F285A` |
| `textPrimary` | `#1F1F23` | `#F7F7F8` |
| `textSecondary` | `#6B6B73` | `#B7BAC2` |
| `outline` | `#E3E5EA` | `#343843` |
| `success` | `#1F8F5F` | `#4CD391` |
| `warning` | `#B76E00` | `#FFC857` |
| `error` | `#D92D3A` | `#FF737D` |

Feature widgets consume semantic roles through `ThemeData`, `ColorScheme`, or
a typed ThemeExtension. They never select a Light or Dark raw value directly.
Plus Jakarta is the Latin family and Cairo is the Arabic family, each with
400, 500, and 700 weights required by the approved type scale.

Foundational component coverage includes buttons, fields, search, icon
actions, cards, badges, section headers, bottom navigation, bottom sheets,
loading/skeleton/empty/error/offline feedback, and accessible focus and
disabled states. Visual deliverables are verified in Arabic/English,
RTL/LTR, Light/Dark, 360×800, 390×844, 412×915, and 200% text scaling.

## 11. Offline and Cache Policy

Cached read-only data:

- Categories.
- Product lists and selected product details.
- Home banners and offers.
- Theme and language preferences.
- Non-sensitive profile display information where appropriate.

Never completed offline:

- Sign-in and sign-up submission.
- Coupon and referral validation.
- Checkout quote finalization.
- Order creation.
- Wallet top-up.
- Wallet debits or credits.
- Payment initiation.
- Bank-transfer submission.

When cached data is displayed without connectivity, the interface shows an explicit offline banner and disables transactional actions.

## 12. Authentication

First-release authentication supports:

- Email and password sign-in.
- Registration.
- Email verification.
- Forgot-password request.
- Password reset.
- Google sign-in on Android and iOS.
- Logout.
- Guest browsing.

Authentication is exposed through `AuthRepository`. Initial behavior is mocked, including configurable success, validation-error, and network-error scenarios. Future token storage uses platform-secure storage.

## 13. Error Handling

Use a typed result and failure model rather than passing raw exceptions into the UI.

Representative failures:

- `NetworkFailure`
- `OfflineFailure`
- `UnauthorizedFailure`
- `ValidationFailure`
- `NotFoundFailure`
- `ConflictFailure`
- `PaymentFailure`
- `StorageFailure`
- `UnknownFailure`

ViewModels translate domain failures into localized, actionable UI states. Sensitive technical details are logged only in development and are not shown to users.

## 14. Testing Strategy

### Unit tests

- Value objects and validation.
- Mappers.
- Repository behavior.
- Checkout and wallet rules.
- ViewModel state transitions.

### Widget tests

- Design-system components.
- Feature widgets in light/dark and RTL/LTR modes.
- Loading, empty, offline, success, and error states.
- Forms and validation behavior.

### Golden tests

- Important supplied screens at reference mobile sizes.
- Arabic and English.
- Light and dark themes.

### Integration tests

- Authentication flows.
- Browse → product → options → cart/checkout.
- Wallet → top-up → payment form.
- Guest-to-auth redirect and return.
- Offline restrictions.

## 15. Quality Rules

- Pages should normally stay below roughly 150 lines; large pages are decomposed into widgets.
- Widgets should have one clear responsibility.
- No data-source or storage access from widgets.
- No business calculations in UI code.
- No hard-coded visible strings.
- No raw design values spread across features.
- No untyped `Map<String, dynamic>` beyond DTO boundaries.
- No service locator globals.
- No generic `catch` that silently discards failures.
- No duplicate widgets with only minor visual differences when a typed variant is sufficient.
- Accessibility labels and tap targets are required.

## 16. Completion Criteria for the Architecture Foundation

The architecture foundation is complete when:

- The project runs on Android and iOS.
- Light/dark themes and Arabic/English switching work at runtime.
- The router shell and protected-route behavior are working.
- Mock repositories can be overridden in tests.
- Core design-system widgets have widget tests.
- At least one complete vertical feature slice proves the architecture from mock data source to page.
- Offline state can be simulated and transactional actions become unavailable.
- Static analysis and the initial test suite pass with no ignored failures.

## 17. Explicit Non-Goals for the First Architecture Pass

- Backend implementation.
- Production payment-provider SDK integration.
- Production push-notification delivery.
- Apple sign-in.
- Broad desktop or web support.
- Splitting the application into multiple Dart packages before there is a demonstrated team or build-system need.
