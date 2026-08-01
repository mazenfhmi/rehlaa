# 1. Comparison of Possible Architectural Options

| Option | Architecture | Advantages | Disadvantages |
| --- | --- | --- | --- |
| **A — Feature-first Clean MVVM** | Organizing the project by features, with presentation, data, and domain layers inside each feature | Scalable, easily testable, prevents folder bloat, ideal for replacing Mocks with APIs | Requires clear commitment to boundaries |
| **B — Layer-first MVVM** | A unified folder for pages, another for repositories, and another for models | Easy at the beginning | Files become coupled as the project grows |
| **C — Multi-package Modular Architecture** | Each feature or design system inside a separate Dart Package | Strong isolation and suitable for multiple teams | Excessive complexity in the first release |

## Recommended Choice

We will adopt **Feature-first Clean MVVM** with a selective Domain layer that is not mandatory for every operation.

This aligns with official Flutter architectural guidelines that recommend separating the UI layer from the data layer, utilizing Views, ViewModels, Repositories, and Services, and adding Use Cases only when business logic is complex or shared across multiple ViewModels. ([Flutter Documentation][1])

---

# 2. Proposed Core Architecture

```text
Flutter Widgets / Pages
          ↓
Riverpod ViewModel
          ↓
Use Case (when needed)
          ↓
Repository Interface
          ↓
┌─────────────────────┬──────────────────────┐
│ Mock Repository     │ API Repository       │
│ Current Version     │ When Backend is Ready│
└─────────────────────┴──────────────────────┘
          ↓
Local Cache / Remote Service
```

## Layer Responsibilities

### Presentation

Contains:

* Pages.
* Feature-specific Widgets.
* ViewModels.
* Presentation / UI States.
* Form Controllers.
* Data formatting for presentation.

A page does NOT contain:

* Pricing logic.
* Storage calls.
* JSON parsing.
* Order creation.
* Coupon application.
* Wallet rules.

Flutter recommends keeping Views strictly responsible for display and receiving user interactions, while moving data and application logic to ViewModels. ([Flutter Documentation][1])

### Domain

Contains:

* Entities.
* Repository Contracts.
* Complex Use Cases.
* Value Objects.
* Shared validation rules.

We will not create a Use Case for every simple call. They will only be used in operations such as:

* Checkout calculation.
* Applying wallet balance to an order.
* Validating product options.
* Constructing product configurations.
* Login / Authentication.
* Wallet top-up.
* Submitting bank transfers.

### Data

Contains:

* Mock Data Sources.
* Local Data Sources.
* Future Remote Data Sources.
* Repository Implementations.
* DTOs.
* Mappers.
* Cache Policies.

---

# 3. Main Project Structure

```text
lib/
├── main.dart
│
├── bootstrap/
│   ├── bootstrap.dart
│   ├── app_environment.dart
│   ├── app_flavor.dart
│   └── provider_observer.dart
│
├── app/
│   ├── app.dart
│   ├── app_startup.dart
│   ├── app_shell.dart
│   └── app_dependencies.dart
│
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
│
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
│
├── shared/
│   ├── domain/
│   └── presentation/
│
├── l10n/
│   ├── app_ar.arb
│   └── app_en.arb
│
└── generated/
```

---

# 4. Internal Feature Structure

Example: Wallet Feature:

```text
features/wallet/
├── data/
│   ├── data_sources/
│   │   ├── wallet_mock_data_source.dart
│   │   ├── wallet_local_data_source.dart
│   │   └── wallet_remote_data_source.dart
│   │
│   ├── dto/
│   │   ├── wallet_dto.dart
│   │   └── wallet_transaction_dto.dart
│   │
│   ├── mappers/
│   │   └── wallet_mapper.dart
│   │
│   ├── repositories/
│   │   ├── mock_wallet_repository.dart
│   │   └── api_wallet_repository.dart
│   │
│   └── mock/
│       └── wallet_mock_data.dart
│
├── domain/
│   ├── entities/
│   │   ├── wallet.dart
│   │   ├── wallet_transaction.dart
│   │   └── wallet_topup.dart
│   │
│   ├── repositories/
│   │   └── wallet_repository.dart
│   │
│   ├── use_cases/
│   │   ├── get_wallet.dart
│   │   ├── get_wallet_transactions.dart
│   │   └── create_wallet_topup.dart
│   │
│   └── value_objects/
│       └── topup_amount.dart
│
└── presentation/
    ├── pages/
    │   └── wallet_page.dart
    │
    ├── view_models/
    │   ├── wallet_view_model.dart
    │   └── wallet_topup_view_model.dart
    │
    ├── states/
    │   ├── wallet_state.dart
    │   └── wallet_topup_state.dart
    │
    └── widgets/
        ├── wallet_balance_card.dart
        ├── wallet_status_badge.dart
        ├── charge_wallet_tile.dart
        ├── transaction_list.dart
        ├── transaction_tile.dart
        ├── topup_amount_field.dart
        ├── quick_amount_grid.dart
        └── wallet_topup_sheet.dart
```

---

# 5. Widget Reuse Strategy

Pages will not be bloated files containing all design details. Each page will be a **composition of small, reusable components**.

## Level 1: Design System Components

Used across all parts of the application:

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
│
├── theme/
│   ├── app_theme.dart
│   ├── light_theme.dart
│   ├── dark_theme.dart
│   ├── app_text_theme.dart
│   ├── app_button_theme.dart
│   └── app_input_theme.dart
│
└── components/
    ├── buttons/
    ├── cards/
    ├── fields/
    ├── feedback/
    ├── images/
    ├── layout/
    ├── navigation/
    ├── overlays/
    ├── selectors/
    └── typography/
```

### Core General Components

```text
AppScaffold
AppPageHeader
AppBottomNavigation
AppPrimaryButton
AppSecondaryButton
AppOutlinedButton
AppIconButton
AppTextField
AppPasswordField
AppSearchField
AppCard
AppGradientCard
AppBadge
AppStatusBadge
AppSectionHeader
AppDivider
AppBottomSheet
AppModalHandle
AppLoadingIndicator
AppSkeleton
AppEmptyState
AppErrorState
AppOfflineBanner
AppNetworkImage
AppPriceText
AppCurrencyText
AppResponsivePadding
AppAsyncValueBuilder
```

## Level 2: Shared Feature Widgets

```text
shared/presentation/widgets/
├── product_card.dart
├── product_horizontal_card.dart
├── product_price.dart
├── product_rating.dart
├── favorite_button.dart
├── payment_method_tile.dart
├── bank_selector_tile.dart
├── bank_details_card.dart
├── receipt_uploader.dart
├── price_summary.dart
├── apply_code_field.dart
├── user_avatar.dart
└── notification_badge.dart
```

## Level 3: Feature-Specific Widgets

For example:

```text
features/checkout/presentation/widgets/
features/wallet/presentation/widgets/
features/home/presentation/widgets/
```

These components will not move to `shared` until they are actually used in at least two features.

## Architectural Rule

```text
Page
  = Layout + Feature Widgets

Feature Widget
  = Design-System Components + Feature Data

Design-System Component
  = Visual behavior only
```

## Visual Contract

The authoritative visual specification is
`doc/specs/2026-08-01-ui-design-system.md`. The `doc/ui.txt` source contributes
the visual language only; it does not replace Rehlaa architecture, navigation,
state management, localization, offline policy, or feature behavior.

The adopted visual foundation is:

```text
Semantic Light/Dark Colors
        ↓
Typography + Spacing + Shape + Motion Tokens
        ↓
Design-System Components with Typed Variants
        ↓
Shared Business Widgets
        ↓
Feature Widgets and Thin Pages
```

The visual contract requires:

* Semantic orange primary actions: `#C94F22` in Light and `#FF9A73` in Dark.
* Purple only for promotional content, never as the primary action identity.
* Plus Jakarta for Latin content and bundled Cairo for Arabic content.
* Directional spacing and positioning for complete RTL/LTR behavior.
* A minimum 48×48 logical-pixel target for every interactive action.
* Theme-defined default, pressed, focused, disabled, loading, selected, and
  error behavior for reusable components.
* No raw visual values inside feature code when a design token or typed
  component variant can express the requirement.

The current implementation baseline is documented in
`doc/2026-08-01-project-audit.md`. The audit classifies the Foundation as
partial: the architecture exists, but build errors, static Home data,
unwired application localization, the legacy primary palette, and missing
visual test coverage must be resolved before starting dependent commerce or
financial features.

---

# 6. Example of Wallet Page after Decomposition

```dart
class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletViewModelProvider);

    return AppScaffold(
      appBar: WalletAppBar(
        onRefresh: () {
          ref.read(walletViewModelProvider.notifier).refresh();
        },
      ),
      body: AppAsyncValueBuilder(
        value: walletState,
        data: (wallet) {
          return WalletContent(
            wallet: wallet,
          );
        },
      ),
    );
  }
}
```

And the page content is decomposed into:

```text
WalletPage
├── WalletAppBar
├── WalletContent
│   ├── WalletBalanceCard
│   ├── ChargeWalletTile
│   ├── TransactionsSectionHeader
│   └── WalletTransactionList
└── AppBottomNavigation
```

`WalletPage` does not contain balance formatting, top-up logic, or transaction tile configuration.

---

# 7. State Management

We will adopt:

* `Riverpod`.
* `Notifier` for mutable synchronous states.
* `AsyncNotifier` for loading and asynchronous operations.
* Standard Providers for dependencies and computed data.
* Riverpod Code Generation.
* Immutable states.

Riverpod documentation recommends using `Notifier` and `AsyncNotifier` for states that change as a result of user interaction, and provides Provider Overrides to swap actual implementations with mock implementations during development and testing. ([riverpod.dev][2])

## Repository Swapping Example

```dart
@riverpod
WalletRepository walletRepository(Ref ref) {
  return MockWalletRepository(
    dataSource: ref.watch(walletMockDataSourceProvider),
  );
}
```

In the future:

```dart
@riverpod
WalletRepository walletRepository(Ref ref) {
  return ApiWalletRepository(
    remoteDataSource: ref.watch(walletRemoteDataSourceProvider),
    localDataSource: ref.watch(walletLocalDataSourceProvider),
  );
}
```

What remains unchanged:

* `WalletPage`.
* `WalletViewModel`.
* Wallet components.
* Domain models.
* UI-specific tests.

---

# 8. Initial Navigation

We will use `go_router` with:

* `StatefulShellRoute` or multi-branch Shell for the navigation bar.
* Redirects for protected routes.
* Future Deep Links.
* Typed routes or centralized constants.
* Unified page transitions.
* Bottom Sheets opened via a service or a clear Route.

Flutter does not recommend traditional Named Routes for most applications and suggests a routing package like `go_router` when advanced navigation, deep links, or multiple Navigators are needed. ([Flutter Documentation][3])

```text
/
├── home
├── favorites
├── cart
├── wallet
├── profile
├── product/:productId
├── checkout
└── auth
    ├── login
    ├── register
    ├── forgot-password
    ├── verify-email
    └── reset-password
```

## Protected Routes

* Favorites.
* Checkout.
* Wallet.
* Orders.
* Profile editing.
* Notifications.

Whereas Home, products, and search can be accessed in guest mode.

---

# 9. Localization and Directionality

We will use:

* `flutter_localizations`.
* `gen_l10n`.
* ARB files.
* `intl`.
* Semantic translation keys.
* Independent formatting for currencies and dates.
* Automatic RTL support.

Flutter provides ARB translation file generation via `gen_l10n` and locale configuration through `MaterialApp`. ([Flutter Documentation][4])

```text
l10n/
├── app_en.arb
└── app_ar.arb
```

Example:

```json
{
  "walletTitle": "Wallet",
  "chargeNow": "Charge Now",
  "currentBalance": "Current Balance"
}
```

```json
{
  "walletTitle": "المحفظة",
  "chargeNow": "اشحن الآن",
  "currentBalance": "الرصيد الحالي"
}
```

Text will not be hardcoded directly inside Widgets.

---

# 10. Proposed Architecture Decision

The adopted baseline will be:

```text
Feature-first Clean MVVM
+ Riverpod AsyncNotifier
+ Repository Interfaces
+ Mock Implementations
+ Selective Use Cases
+ Central Design System
+ Reusable Feature Widgets
+ go_router
+ Arabic/English
+ Partial Offline Cache
+ Android/iOS
```

Your specific requirement of using Widgets across all pages is fulfilled by decomposing components into:

```text
Design System Widgets
        ↓
Shared Business Widgets
        ↓
Feature Widgets
        ↓
Thin Pages
```
