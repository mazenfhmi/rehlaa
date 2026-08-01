# Flutter Mobile Application — Complete Implementation Plan

This consolidated document contains the master implementation roadmap and all sub-plans, arranged by dependencies.

## Authoritative Source Manifest

This aggregate is governed by, in order:

1. `doc/plans/2026-08-01-rehlaa-master-execution-plan.md` for execution order, current state, decision gates, and phase gates.
2. `doc/specs/2026-07-31-flutter-mobile-app-design.md` for product and architecture.
3. `doc/specs/2026-08-01-ui-design-system.md` for all visual decisions.
4. `doc/2026-08-01-project-audit.md` for its historical audited baseline and stabilization findings.
5. The individual plans in `doc/plans/` for task-level execution details.
6. `doc/plans/2026-08-01-ui-plan-alignment.md` for documentation synchronization checks.

If an embedded section in this consolidated document becomes inconsistent with
an individual plan, the individual plan is authoritative and this file must be
synchronized before execution. `doc/ui.txt` remains an immutable visual source.

The visual contract applies to every embedded plan: semantic orange primary
actions (`#C94F22`/`#FF9A73`), promotional-only purple, Plus Jakarta/Cairo,
token-only feature styling, Light/Dark, RTL/LTR, 48×48 targets, WCAG contrast,
and 200% text scaling. No embedded section may redefine these rules.

---

# Flutter Mobile Application Master Implementation Roadmap

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Building a digital service store application for mobile using Flutter on Android and iOS, with Arabic and English interfaces, Mock data that can be replaced later with the API, and a unified Widget system covering all pages.

**Architecture:** The project relies on Feature-first Clean MVVM with Riverpod for state and dependency management, Repository Contracts for data source isolation, and an elective Domain layer for shared and complex logic. All features start with Mock sources and read-only local memory, while purchases, payments, and wallet operations are prohibited offline.

**Tech Stack:** Flutter 3.44.x, Dart 3.12.x, Material 3, flutter_riverpod 3.4.1, riverpod_annotation 4.0.5, riverpod_generator 4.0.7, go_router 17.3.0, Freezed 3.2.5, json_serializable 6.14.0, Drift 2.34.3, intl, connectivity_plus, shared_preferences, flutter_secure_storage, cached_network_image, flutter_svg, image_picker/file_picker, mocktail, flutter_test, integration_test.

## Global Constraints

- The target platforms in the first release: Android and iOS only.
- Minimum development environment: Flutter 3.44.x and Dart 3.12.x.
- Verified local baseline: Flutter 3.41.2 and Dart 3.11.0; upgrade or explicitly revise the target before a release Build is accepted.
- Languages: Arabic and English from the first release with full RTL/LTR.
- State and dependency management: Riverpod using Notifier and AsyncNotifier and code generation.
- Architecture: Feature-first Clean MVVM with Domain selective and Repository Contracts.
- Current data source: Mock repositories only; do not create empty API implementations.
- Local storage: non-sensitive read data and settings only; do not execute financial operations without connection.
- Authentication: email/password and Google, with guest browsing, without Apple Sign-In.
- All visible texts come from ARB; prevent hard-coded user-facing strings.
- All spacing, colors, borders, fonts, and movements come from Design Tokens.
- Thin Pages; the goal is less than 150 lines per page, with it being broken down into Widgets.
- Prevent access to Repository, Storage, or DataSource directly from Widget.
- Prevent using `double` for money; use the smallest integer unit via `Money.minorUnits`.
- Do not use `Map<String, dynamic>` outside the limits of DTO and mock sources.
- All tasks are executed in TDD style, ending with successful tests and an independent commit.
- No phase is accepted with `flutter analyze` errors or ignored tests.
- Foundation Task 0 and `doc/2026-08-01-project-audit.md` must be cleared before Catalog or financial feature execution.
- All visual work follows `doc/specs/2026-08-01-ui-design-system.md`.

---

## 1. Execution Segmentation into Independent Plans

The project is executed in the following order, and no plan depending on another is started before passing the quality gate of the previous plan:

| Order | Plan | Testable Output |
|---:|---|---|
| 1 | `2026-07-31-flutter-foundation.md` | Runnable project, Theme/L10n/Router/Design System/Offline foundation and a single Vertical Slice |
| 2 | `2026-07-31-flutter-authentication.md` | Mock authentication flows complete, guest, and protection and redirection |
| 3 | `2026-07-31-flutter-catalog-commerce.md` | Home, products, details, options, favorites, and cart |
| 4 | `2026-07-31-flutter-checkout-payments.md` | Checkout, coupon, referral, partial wallet, and payment/transfer methods |
| 5 | `2026-07-31-flutter-wallet.md` | Wallet, balance, movements, top-up, and transfer receipt upload |
| 6 | `2026-07-31-flutter-profile-settings.md` | Profile, account edit, language, theme, notifications, and sign out |
| 7 | `2026-07-31-flutter-phase-2-features.md` | Orders, notifications, search and filters, support and policies |
| 8 | `2026-07-31-flutter-quality-release.md` | Golden/Integration/Accessibility/Performance/CI and prepare Android and iOS builds |

## 2. Dependency Map Between Features

```text
Foundation
├── Authentication
│   ├── Favorites
│   ├── Checkout
│   ├── Wallet
│   └── Profile
├── Catalog
│   ├── Product Details
│   ├── Favorites
│   └── Cart
├── Checkout
│   ├── Payment Methods
│   └── Bank Transfer
└── Wallet
    └── Wallet Top-up Checkout
```

## 3. Building UI Sequences

### Phase One: Structure and Identity

1. Bootstrap and operating environments.
2. Design Tokens and theming.
3. Translation and text direction.
4. Public Widgets.
5. Router Shell and navigation bar.
6. Loading/Empty/Error/Offline states.

### Phase Two: Authentication and Catalog

1. Login.
2. Register.
3. Email verification.
4. Forgot/reset password.
5. Home.
6. Product details.
7. Favorites.
8. Empty/populated cart.

### Phase Three: Financial Operations

1. Checkout summary.
2. Coupon/referral.
3. Wallet allocation.
4. Payment method selection.
5. Bank selection/details.
6. Operation number and receipt upload.
7. Wallet dashboard.
8. Wallet top-up sheet.

### Phase Four: Profile and Expansion

1. Profile.
2. Account edit.
3. Language/theme/notifications settings.
4. Orders and order details.
5. Notifications center.
6. Search/filter.
7. Support and policy pages.

## 4. Widget Reuse Rules

```text
Page
└── Feature Widgets
    ├── Shared Business Widgets
    └── Design System Widgets
```

- Put a Widget in `core/design_system/components` when it is visually general and has no business logic.
- Put it in `shared/presentation/widgets` when two features actually use it.
- Keep it inside `features/<feature>/presentation/widgets` if it is specific to one feature.
- Do not create default Widgets in advance just in case they are used in the future.
- Each Widget receives its data via constructor and reads Provider only at the page boundary or clear layout Widget.

## 5. Quality Gates

### Quality Gate per Task

```bash
flutter analyze
flutter test <targeted_test_path>
```

### Quality Gate per Plan

```bash
flutter analyze
flutter test
flutter test integration_test
```

### Release Quality Gate

```bash
flutter build appbundle --release
flutter build ipa --release --no-codesign
```

And verify that:

- No Overflow on 360×800, 390×844, and 412×915.
- RTL and LTR success.
- Light and Dark success.
- All important buttons have Loading/Disabled/Error states.
- All images have Loading fallback and Error state.
- Touch targets no less than 48×48 logical pixels.
- Financial operations are not available in Offline mode.

## 6. Branch and Commit Strategy

- Independent branch for each plan: `feature/foundation`, `feature/auth`, `feature/catalog`, etc.
- At least one commit per Task.
- Commit messages in Conventional Commits format:

```text 
feat(wallet): add balance dashboard
fix(checkout): preserve ltr account number in arabic
refactor(ui): extract shared payment method tile
test(auth): cover guest redirect flow
```

## 7. Definition of Done

The mobile application is considered complete when:

- All screens from the first and second phases of the plan work with consistent Mock data.
- Arabic and English and themes work during operation without restarting the application.
- Supports browsing as a guest and requests authentication for protected actions and then returns the user to their destination.
- Displays cached catalog data when the network is lost and prevents payment and wallet.
- Main screens match the reference images within the limits of the available assets.
- Unit, Widget, Golden, and Integration tests pass.
- Android App Bundle and iOS IPA builds succeed without analysis or ignored test errors.
- Mock Repository can be replaced via Provider override without modifying public Pages or ViewModels.


---

# Flutter Architecture Foundation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a production Flutter project foundation that supports Android/iOS, Arabic/English, Light/Dark, Riverpod, go_router, Design System, local storage, and connection state, with a test-proven Vertical Slice.

**Architecture:** Feature-first Clean MVVM with generated Riverpod providers, immutable models, Repository contracts, and centralized Design System components. This foundation establishes architectural boundaries before adding application features.

**Tech Stack:** Flutter 3.44.x, Dart 3.12.x, Material 3, Riverpod, go_router, Freezed, Drift, intl, connectivity_plus, shared_preferences, mocktail.

## Global Constraints

- Android and iOS only.
- Flutter 3.44.x and Dart 3.12.x.
- Arabic and English with RTL/LTR.
- Pages are thin, Widgets are reusable, and no business logic inside UI.
- All texts from ARB and all visual values from Tokens.
- TDD and independent commit per Task.
- Visual contract: `doc/specs/2026-08-01-ui-design-system.md`; verified baseline: `doc/2026-08-01-project-audit.md`.
- Execute Foundation Task 0 from the individual Foundation plan before this embedded Task 1.
- Semantic orange primary, promotional-only purple, Plus Jakarta/Cairo, 48×48, and 200% text scaling are mandatory.

---

## File Map

```text
lib/
├── main.dart                         # entry point only
├── bootstrap/bootstrap.dart          # guarded startup
├── bootstrap/app_environment.dart    # environment values
├── bootstrap/provider_observer.dart  # development diagnostics
├── app/app.dart                      # MaterialApp.router
├── app/app_startup.dart              # async startup state
├── app/app_shell.dart                # bottom navigation shell
├── core/result/result.dart           # typed success/failure
├── core/errors/app_failure.dart       # failure hierarchy
├── core/design_system/...            # tokens, themes, components
├── core/localization/...             # locale state and formatters
├── core/navigation/app_router.dart    # route tree
├── core/network/connectivity_service.dart
├── core/storage/app_database.dart
├── core/storage/preferences_store.dart
└── features/home/...                  # proof vertical slice
```

### Task 1: Initialize the Flutter project and strict analysis

**Files:**
- Create: `pubspec.yaml`
- Create: `analysis_options.yaml`
- Create: `lib/main.dart`
- Create: `test/smoke/app_boot_test.dart`

**Interfaces:**
- Produces: Flutter application package named `rehlaa_mobile`.
- Produces: `void main()` entry point.

- [ ] **Step 1: Create the project**

```bash
flutter create --org com.rehlaa --platforms=android,ios --empty rehlaa_mobile
cd rehlaa_mobile
flutter --version
```

Expected: Flutter 3.44.x and Dart 3.12.x.

- [ ] **Step 2: Add strict analysis configuration**

```yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  errors:
    invalid_annotation_target: ignore
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"

linter:
  rules:
    always_use_package_imports: true
    avoid_dynamic_calls: true
    avoid_print: true
    directives_ordering: true
    prefer_final_locals: true
    require_trailing_commas: true
    sort_constructors_first: true
    unawaited_futures: true
```

- [ ] **Step 3: Write the failing smoke test**

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa_mobile/app/app.dart';

void main() {
  testWidgets('app boots without throwing', (tester) async {
    await tester.pumpWidget(const rehlaaApp());
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
```

- [ ] **Step 4: Run the test and verify failure**

```bash
flutter test test/smoke/app_boot_test.dart
```

Expected: FAIL because `lib/app/app.dart` does not exist.

- [ ] **Step 5: Commit the project shell**

```bash
git add .
git commit -m "chore: initialize flutter mobile project"
```

### Task 2: Add dependencies and code-generation configuration

**Files:**
- Modify: `pubspec.yaml`
- Create: `build.yaml`

**Interfaces:**
- Produces: generated Riverpod, Freezed, JSON, and Drift code via `dart run build_runner build`.

- [ ] **Step 1: Add runtime dependencies**

```bash
flutter pub add flutter_riverpod:^3.4.1 riverpod_annotation:^4.0.5 go_router:^17.3.0
flutter pub add freezed_annotation:^3.1.0 json_annotation intl
flutter pub add drift:^2.34.3 drift_flutter shared_preferences connectivity_plus
flutter pub add flutter_secure_storage cached_network_image flutter_svg
```

- [ ] **Step 2: Add development dependencies**

```bash
flutter pub add --dev riverpod_generator:^4.0.7 build_runner freezed:^3.2.5
flutter pub add --dev json_serializable:^6.14.0 drift_dev mocktail
```

- [ ] **Step 3: Configure deterministic generators**

```yaml
targets:
  $default:
    builders:
      json_serializable:
        options:
          checked: true
          explicit_to_json: true
          include_if_null: false
```

- [ ] **Step 4: Verify dependency resolution**

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
```

Expected: all commands exit 0.

- [ ] **Step 5: Commit**

```bash
git add pubspec.yaml pubspec.lock build.yaml
git commit -m "chore: configure core flutter dependencies"
```

### Task 3: Implement typed results and failures

**Files:**
- Create: `lib/core/errors/app_failure.dart`
- Create: `lib/core/result/result.dart`
- Test: `test/core/result/result_test.dart`

**Interfaces:**
- Produces: `sealed class AppFailure`.
- Produces: `sealed class Result<T>` with `Success<T>` and `Failure<T>`.

- [ ] **Step 1: Write failing tests**

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/errors/app_failure.dart';
import 'package:rehlaa/core/result/result.dart';

void main() {
  test('success exposes value', () {
    const result = Success<int>(42);
    expect(result.value, 42);
  });

  test('failure exposes typed failure', () {
    const result = Failure<int>(OfflineFailure());
    expect(result.failure, isA<OfflineFailure>());
  });
}
```

- [ ] **Step 2: Verify failure**

```bash
flutter test test/core/result/result_test.dart
```

Expected: FAIL with missing imports.

- [ ] **Step 3: Implement the failure hierarchy**

```dart
sealed class AppFailure {
  const AppFailure();
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure();
}

final class OfflineFailure extends AppFailure {
  const OfflineFailure();
}

final class UnauthorizedFailure extends AppFailure {
  const UnauthorizedFailure();
}

final class ValidationFailure extends AppFailure {
  const ValidationFailure(this.fieldErrors);
  final Map<String, String> fieldErrors;
}

final class NotFoundFailure extends AppFailure {
  const NotFoundFailure();
}

final class ConflictFailure extends AppFailure {
  const ConflictFailure();
}

final class PaymentFailure extends AppFailure {
  const PaymentFailure();
}

final class StorageFailure extends AppFailure {
  const StorageFailure();
}

final class UnknownFailure extends AppFailure {
  const UnknownFailure();
}
```

- [ ] **Step 4: Implement Result**

```dart
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

final class Failure<T> extends Result<T> {
  const Failure(this.failure);
  final AppFailure failure;
}
```

- [ ] **Step 5: Run tests and commit**

```bash
flutter test test/core/result/result_test.dart
git add lib/core/errors lib/core/result test/core/result
git commit -m "feat(core): add typed result and failure model"
```

### Task 4: Build bootstrap and Riverpod diagnostics

**Files:**
- Create: `lib/bootstrap/app_environment.dart`
- Create: `lib/bootstrap/provider_observer.dart`
- Create: `lib/bootstrap/bootstrap.dart`
- Modify: `lib/main.dart`
- Test: `test/bootstrap/bootstrap_test.dart`

**Interfaces:**
- Produces: `enum AppEnvironment { development, staging, production }`.
- Produces: `Future<void> bootstrap({required AppEnvironment environment})`.

- [ ] **Step 1: Write failing environment test**

```dart
void main() {
  test('development enables diagnostics', () {
    expect(AppEnvironment.development.enableDiagnostics, isTrue);
    expect(AppEnvironment.production.enableDiagnostics, isFalse);
  });
}
```

- [ ] **Step 2: Implement environment values**

```dart
enum AppEnvironment { development, staging, production }

extension AppEnvironmentX on AppEnvironment {
  bool get enableDiagnostics => this != AppEnvironment.production;
  bool get useMockRepositories => true;
}
```

- [ ] **Step 3: Implement guarded bootstrap**

```dart
Future<void> bootstrap({required AppEnvironment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = FlutterError.presentError;
  runApp(
    ProviderScope(
      observers: [if (environment.enableDiagnostics) AppProviderObserver()],
      child: const rehlaaApp(),
    ),
  );
}
```

- [ ] **Step 4: Wire main**

```dart
Future<void> main() => bootstrap(
      environment: AppEnvironment.development,
    );
```

- [ ] **Step 5: Verify and commit**

```bash
flutter test test/bootstrap/bootstrap_test.dart
flutter analyze
git add lib/bootstrap lib/main.dart test/bootstrap
git commit -m "feat(core): add guarded riverpod bootstrap"
```

### Task 5: Implement localization and runtime locale switching

**Files:**
- Modify: `pubspec.yaml`
- Create: `l10n.yaml`
- Create: `lib/l10n/app_en.arb`
- Create: `lib/l10n/app_ar.arb`
- Create: `lib/core/localization/locale_controller.dart`
- Create: `lib/core/localization/context_l10n.dart`
- Test: `test/core/localization/locale_controller_test.dart`

**Interfaces:**
- Produces: `LocaleController extends _$LocaleController`.
- Produces: `BuildContext.l10n` extension.

- [ ] **Step 1: Enable Flutter code generation**

```yaml
flutter:
  generate: true
  uses-material-design: true
```

- [ ] **Step 2: Add ARB seed keys**

```json
{
  "@@locale": "en",
  "appName": "rehlaa",
  "homeTitle": "Home",
  "favoritesTitle": "Favorites",
  "cartTitle": "Cart",
  "walletTitle": "Wallet",
  "profileTitle": "Profile",
  "offlineMessage": "You are viewing saved data. Transactions are unavailable."
}
```

```json
{
  "@@locale": "ar",
  "appName": "رحلة",
  "homeTitle": "الرئيسية",
  "favoritesTitle": "المفضلة",
  "cartTitle": "السلة",
  "walletTitle": "المحفظة",
  "profileTitle": "الملف الشخصي",
  "offlineMessage": "أنت تعرض بيانات محفوظة. العمليات المالية غير متاحة."
}
```

- [ ] **Step 3: Write failing controller test**

```dart
test('changes locale between arabic and english', () {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  expect(container.read(localeControllerProvider), const Locale('en'));
  container.read(localeControllerProvider.notifier).setLocale(const Locale('ar'));
  expect(container.read(localeControllerProvider), const Locale('ar'));
});
```

- [ ] **Step 4: Implement controller**

```dart
@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  @override
  Locale build() => const Locale('en');

  void setLocale(Locale locale) {
    if (!const {'ar', 'en'}.contains(locale.languageCode)) return;
    state = locale;
  }
}
```

- [ ] **Step 5: Generate, test, and commit**

```bash
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter test test/core/localization/locale_controller_test.dart
git add pubspec.yaml l10n.yaml lib/l10n lib/core/localization test/core/localization
git commit -m "feat(l10n): add arabic and english runtime localization"
```

### Task 6: Implement token-driven light and dark themes

**Files:**
- Create: `lib/core/design_system/tokens/app_colors.dart`
- Create: `lib/core/design_system/tokens/app_spacing.dart`
- Create: `lib/core/design_system/tokens/app_radius.dart`
- Create: `lib/core/design_system/tokens/app_sizes.dart`
- Create: `lib/core/design_system/theme/app_theme.dart`
- Create: `lib/core/design_system/theme/theme_controller.dart`
- Test: `test/core/design_system/theme/theme_test.dart`

**Interfaces:**
- Produces: `AppTheme.light()` and `AppTheme.dark()`.
- Produces: `ThemeController` with `ThemeMode.system/light/dark`.

- [ ] **Step 1: Write failing theme tests**

```dart
test('dark theme uses the dark background token', () {
  expect(AppTheme.dark().scaffoldBackgroundColor, AppColors.darkBackground);
});

test('light and dark themes expose semantic primary roles', () {
  expect(AppTheme.light().colorScheme.primary, const Color(0xFFC94F22));
  expect(AppTheme.light().colorScheme.onPrimary, const Color(0xFFFFFFFF));
  expect(AppTheme.dark().colorScheme.primary, const Color(0xFFFF9A73));
  expect(AppTheme.dark().colorScheme.onPrimary, const Color(0xFF24120B));
});
```

- [ ] **Step 2: Implement tokens**

```dart
abstract final class AppLightColors {
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceMuted = Color(0xFFF5F6F9);
  static const primary = Color(0xFFC94F22);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFFFECDF);
  static const brandDecorative = Color(0xFFFF7643);
  static const promotionalContainer = Color(0xFF4A3298);
  static const textPrimary = Color(0xFF1F1F23);
  static const textSecondary = Color(0xFF6B6B73);
  static const outline = Color(0xFFE3E5EA);
}

abstract final class AppDarkColors {
  static const background = Color(0xFF121318);
  static const surface = Color(0xFF1C1E24);
  static const surfaceMuted = Color(0xFF252832);
  static const primary = Color(0xFFFF9A73);
  static const onPrimary = Color(0xFF24120B);
  static const primaryContainer = Color(0xFF3D241C);
  static const brandDecorative = Color(0xFFFF8A5C);
  static const promotionalContainer = Color(0xFF2F285A);
  static const textPrimary = Color(0xFFF7F7F8);
  static const textSecondary = Color(0xFFB7BAC2);
  static const outline = Color(0xFF343843);
}
```

```dart
abstract final class AppSpacing {
  static const x1 = 4.0;
  static const x2 = 8.0;
  static const x3 = 12.0;
  static const x4 = 16.0;
  static const x5 = 20.0;
  static const x6 = 24.0;
  static const x8 = 32.0;
}
```

- [ ] **Step 3: Implement theme controller**

```dart
@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() => ThemeMode.system;

  void setThemeMode(ThemeMode mode) => state = mode;
}
```

- [ ] **Step 4: Run tests and commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/core/design_system/theme/theme_test.dart
git add lib/core/design_system test/core/design_system
git commit -m "feat(ui): add token driven light and dark themes"
```

### Task 7: Build foundational reusable widgets

**Files:**
- Create: `lib/core/design_system/components/buttons/app_primary_button.dart`
- Create: `lib/core/design_system/components/fields/app_text_field.dart`
- Create: `lib/core/design_system/components/cards/app_card.dart`
- Create: `lib/core/design_system/components/layout/app_scaffold.dart`
- Create: `lib/core/design_system/components/feedback/app_async_value_builder.dart`
- Create: `lib/core/design_system/components/feedback/app_empty_state.dart`
- Create: `lib/core/design_system/components/feedback/app_error_state.dart`
- Create: `lib/core/design_system/components/feedback/app_offline_banner.dart`
- Test: `test/core/design_system/components/app_primary_button_test.dart`
- Test: `test/core/design_system/components/app_text_field_test.dart`

**Interfaces:**
- Produces: reusable widgets listed above.

- [ ] **Step 1: Write button tests**

```dart
testWidgets('disabled button ignores taps', (tester) async {
  var taps = 0;
  await tester.pumpWidget(
    testApp(AppPrimaryButton(label: 'Save', onPressed: null)),
  );
  await tester.tap(find.text('Save'));
  expect(taps, 0);
});
```

- [ ] **Step 2: Implement button states**

```dart
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.leading,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 8)],
                  Text(label),
                ],
              ),
      ),
    );
  }
}
```

- [ ] **Step 3: Implement field, card, scaffold, and feedback widgets**

Use typed constructor properties only; `AppTextField` must support label, hint, controller, errorText, prefix, suffix, text direction, keyboard type, and obscuring without feature logic.

- [ ] **Step 4: Verify light/dark and RTL/LTR widget tests**

```bash
flutter test test/core/design_system/components
flutter analyze
```

Expected: PASS with no overflow or semantics failures.

- [ ] **Step 5: Commit**

```bash
git add lib/core/design_system/components test/core/design_system/components
git commit -m "feat(ui): add foundational reusable widgets"
```

### Task 8: Implement connectivity and local preferences

**Files:**
- Create: `lib/core/network/connectivity_service.dart`
- Create: `lib/core/storage/preferences_store.dart`
- Create: `lib/core/network/network_status_controller.dart`
- Test: `test/core/network/network_status_controller_test.dart`

**Interfaces:**
- Produces: `enum NetworkStatus { online, offline }`.
- Produces: `Stream<NetworkStatus> ConnectivityService.watch()`.
- Produces: `PreferencesStore` for locale/theme only.

- [ ] **Step 1: Write failing offline state test**

```dart
test('emits offline when connectivity service reports none', () async {
  final service = FakeConnectivityService(NetworkStatus.offline);
  expect(await service.watch().first, NetworkStatus.offline);
});
```

- [ ] **Step 2: Implement service abstraction**

```dart
abstract interface class ConnectivityService {
  Stream<NetworkStatus> watch();
  Future<NetworkStatus> current();
}
```

- [ ] **Step 3: Implement preferences contract**

```dart
abstract interface class PreferencesStore {
  Future<void> setLocaleCode(String code);
  Future<String?> getLocaleCode();
  Future<void> setThemeMode(String value);
  Future<String?> getThemeMode();
}
```

- [ ] **Step 4: Test and commit**

```bash
flutter test test/core/network/network_status_controller_test.dart
git add lib/core/network lib/core/storage/preferences_store.dart test/core/network
git commit -m "feat(core): add connectivity and preferences services"
```

### Task 9: Implement shell routing and temporary branch pages

**Files:**
- Create: `lib/core/navigation/app_route_names.dart`
- Create: `lib/core/navigation/app_router.dart`
- Create: `lib/app/app_shell.dart`
- Create: `lib/shared/presentation/widgets/app_bottom_navigation.dart`
- Create: `lib/features/home/presentation/pages/home_page.dart`
- Create: temporary branch pages for favorites, cart, wallet, and profile using `AppEmptyState`
- Modify: `lib/app/app.dart`
- Test: `test/core/navigation/app_router_test.dart`

**Interfaces:**
- Produces: `GoRouter appRouter(Ref ref)`.
- Produces: five persistent shell branches.

- [ ] **Step 1: Write failing shell navigation test**

```dart
testWidgets('switches from home to wallet branch', (tester) async {
  await tester.pumpWidget(providerTestApp(initialLocation: '/home'));
  await tester.tap(find.text('Wallet'));
  await tester.pumpAndSettle();
  expect(find.byKey(const Key('wallet-page')), findsOneWidget);
});
```

- [ ] **Step 2: Implement `StatefulShellRoute.indexedStack`**

Define branches for `/home`, `/favorites`, `/cart`, `/wallet`, and `/profile`; use `navigationShell.goBranch(index, initialLocation: index == currentIndex)`.

- [ ] **Step 3: Wire `MaterialApp.router`**

```dart
class rehlaaApp extends ConsumerWidget {
  const rehlaaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeControllerProvider);
    final themeMode = ref.watch(themeControllerProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
```

- [ ] **Step 4: Run router and smoke tests**

```bash
flutter test test/core/navigation/app_router_test.dart
flutter test test/smoke/app_boot_test.dart
```

- [ ] **Step 5: Commit**

```bash
git add lib/app lib/core/navigation lib/shared/presentation/widgets lib/features test/core/navigation test/smoke
git commit -m "feat(navigation): add persistent five branch app shell"
```

### Task 10: Prove the architecture with a Home vertical slice

**Files:**
- Create: `lib/features/home/domain/entities/home_category.dart`
- Create: `lib/features/home/domain/repositories/home_repository.dart`
- Create: `lib/features/home/data/data_sources/home_mock_data_source.dart`
- Create: `lib/features/home/data/repositories/mock_home_repository.dart`
- Create: `lib/features/home/presentation/view_models/home_view_model.dart`
- Create: `lib/features/home/presentation/widgets/category_chip.dart`
- Modify: `lib/features/home/presentation/pages/home_page.dart`
- Test: `test/features/home/home_view_model_test.dart`
- Test: `test/features/home/home_page_test.dart`

**Interfaces:**
- Produces: `Future<Result<List<HomeCategory>>> HomeRepository.getCategories()`.
- Produces: `HomeViewModel extends _$HomeViewModel`.

- [ ] **Step 1: Write repository and ViewModel tests**

```dart
test('loads categories from the repository', () async {
  final container = ProviderContainer(
    overrides: [homeRepositoryProvider.overrideWithValue(FakeHomeRepository())],
  );
  addTearDown(container.dispose);
  final categories = await container.read(homeViewModelProvider.future);
  expect(categories.first.nameEn, 'All');
});
```

- [ ] **Step 2: Implement entity and contract**

```dart
@freezed
abstract class HomeCategory with _$HomeCategory {
  const factory HomeCategory({
    required String id,
    required String nameAr,
    required String nameEn,
    required String iconAsset,
  }) = _HomeCategory;
}

abstract interface class HomeRepository {
  Future<Result<List<HomeCategory>>> getCategories();
}
```

- [ ] **Step 3: Implement Mock repository and provider binding**

Return deterministic data for All, Gaming, Mobile, Educational Programs, Software Tools, Subscriptions, Creative Packages, and Entertainment.

- [ ] **Step 4: Implement the page using reusable widgets**

`HomePage` must only watch `homeViewModelProvider`, display `AppAsyncValueBuilder`, and compose `HomeHeader`, `CategorySection`, and `AppOfflineBanner`.

- [ ] **Step 5: Verify complete foundation**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run -d android
```

- [ ] **Step 6: Commit**

```bash
git add lib/features/home test/features/home
git commit -m "feat(home): prove architecture with mock category slice"
```


---

# Flutter Authentication Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** تنفيذ مصادقة Mock كاملة عبر البريد وكلمة المرور وGoogle، مع تسجيل حساب، تحقق بريد، استعادة كلمة المرور، جلسة ضيف، حماية المسارات، وإعادة المستخدم إلى وجهته المقصودة.

**Architecture:** تعرض الميزة عقد `AuthRepository` وحالة `AuthSession` مستقلة عن مزود المصادقة. تستخدم الشاشات ViewModels منفصلة للنماذج، بينما يعتمد Router على مزود جلسة واحد للحماية وإعادة التوجيه.

**Tech Stack:** Riverpod AsyncNotifier، Freezed، go_router، flutter_secure_storage contract، mocktail، Flutter form validation.

## Global Constraints

- المصدر الحالي Mock فقط.
- لا تُخزن كلمة المرور محليًا.
- التصفح العام متاح كضيف.
- Favorites/Checkout/Wallet/Profile Edit محمية.
- جميع الرسائل مترجمة.
- Visual contract: `doc/specs/2026-08-01-ui-design-system.md`.
- Auth Pages use themed radius-28 fields, 52-pixel actions, localized copy, keyboard-safe scrolling, and ViewModels rather than direct Repository reads.
- Cover Light English, Dark Arabic, 48×48, and 200% text scaling.

---

## File Map

```text
features/authentication/
├── domain/entities/auth_session.dart
├── domain/entities/auth_user.dart
├── domain/repositories/auth_repository.dart
├── domain/value_objects/email_address.dart
├── domain/value_objects/password.dart
├── data/data_sources/auth_mock_data_source.dart
├── data/repositories/mock_auth_repository.dart
└── presentation/
    ├── pages/login_page.dart
    ├── pages/register_page.dart
    ├── pages/verify_email_page.dart
    ├── pages/forgot_password_page.dart
    ├── pages/reset_password_page.dart
    ├── view_models/auth_session_controller.dart
    ├── view_models/login_view_model.dart
    └── widgets/auth_form_card.dart
```

### Task 1: Define authentication entities and repository contract

**Files:**
- Create: `lib/features/authentication/domain/entities/auth_user.dart`
- Create: `lib/features/authentication/domain/entities/auth_session.dart`
- Create: `lib/features/authentication/domain/repositories/auth_repository.dart`
- Test: `test/features/authentication/domain/auth_session_test.dart`

**Interfaces:**
- Produces: `AuthSession.guest()`, `AuthSession.authenticated(AuthUser)`, `AuthSession.unverified(AuthUser)`.
- Produces: methods `signIn`, `register`, `signInWithGoogle`, `requestPasswordReset`, `resetPassword`, `verifyEmail`, `signOut`, `restoreSession`.

- [ ] **Step 1: Write failing session tests**

```dart
test('guest is not authenticated', () {
  const session = AuthSession.guest();
  expect(session.isAuthenticated, isFalse);
});

test('authenticated session exposes user', () {
  const user = AuthUser(id: 'u1', email: 'user@example.com', displayName: 'User');
  const session = AuthSession.authenticated(user);
  expect(session.user, user);
});
```

- [ ] **Step 2: Implement immutable entities**

Use Freezed unions for guest, unverified, and authenticated states.

- [ ] **Step 3: Implement repository contract**

```dart
abstract interface class AuthRepository {
  Future<Result<AuthSession>> restoreSession();
  Future<Result<AuthSession>> signIn({required String email, required String password});
  Future<Result<AuthSession>> register({required String name, required String email, required String password});
  Future<Result<AuthSession>> signInWithGoogle();
  Future<Result<void>> verifyEmail(String code);
  Future<Result<void>> requestPasswordReset(String email);
  Future<Result<void>> resetPassword({required String token, required String password});
  Future<Result<void>> signOut();
}
```

- [ ] **Step 4: Generate and test**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/features/authentication/domain/auth_session_test.dart
```

- [ ] **Step 5: Commit**

```bash
git add lib/features/authentication/domain test/features/authentication/domain
git commit -m "feat(auth): define authentication domain contracts"
```

### Task 2: Implement email and password value objects

**Files:**
- Create: `lib/features/authentication/domain/value_objects/email_address.dart`
- Create: `lib/features/authentication/domain/value_objects/password.dart`
- Test: `test/features/authentication/domain/credentials_validation_test.dart`

**Interfaces:**
- Produces: `EmailAddress.parse(String)`.
- Produces: `Password.parse(String)` requiring at least 8 characters, uppercase, lowercase, and digit.

- [ ] **Step 1: Write validation tests**

```dart
test('rejects malformed email', () {
  expect(() => EmailAddress.parse('invalid'), throwsA(isA<FormatException>()));
});

test('accepts strong password', () {
  expect(Password.parse('Strong123').value, 'Strong123');
});
```

- [ ] **Step 2: Implement value objects**

Ensure the raw value is trimmed for email and preserved for password.

- [ ] **Step 3: Run and commit**

```bash
flutter test test/features/authentication/domain/credentials_validation_test.dart
git add lib/features/authentication/domain/value_objects test/features/authentication/domain
git commit -m "feat(auth): add credential value object validation"
```

### Task 3: Implement deterministic Mock authentication repository

**Files:**
- Create: `lib/features/authentication/data/data_sources/auth_mock_data_source.dart`
- Create: `lib/features/authentication/data/repositories/mock_auth_repository.dart`
- Create: `lib/features/authentication/data/providers/auth_providers.dart`
- Test: `test/features/authentication/data/mock_auth_repository_test.dart`

**Interfaces:**
- Consumes: `AuthRepository` contract.
- Produces: configurable `AuthMockScenario.success`, `.invalidCredentials`, `.networkFailure`, `.emailUnverified`.

- [ ] **Step 1: Write failing scenario tests**

```dart
test('returns unauthorized for invalid credentials scenario', () async {
  final repository = MockAuthRepository(
    dataSource: AuthMockDataSource(scenario: AuthMockScenario.invalidCredentials),
  );
  final result = await repository.signIn(email: 'user@example.com', password: 'Strong123');
  expect(result, isA<Failure<AuthSession>>());
});
```

- [ ] **Step 2: Implement scenario enum and deterministic delay**

Use a fixed 350ms delay and never randomize test behavior.

- [ ] **Step 3: Bind provider**

```dart
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return MockAuthRepository(dataSource: ref.watch(authMockDataSourceProvider));
}
```

- [ ] **Step 4: Test and commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/features/authentication/data/mock_auth_repository_test.dart
git add lib/features/authentication/data test/features/authentication/data
git commit -m "feat(auth): add deterministic mock authentication repository"
```

### Task 4: Implement session and form ViewModels

**Files:**
- Create: `lib/features/authentication/presentation/view_models/auth_session_controller.dart`
- Create: `lib/features/authentication/presentation/view_models/login_view_model.dart`
- Create: `lib/features/authentication/presentation/view_models/register_view_model.dart`
- Create: `lib/features/authentication/presentation/states/auth_form_state.dart`
- Test: `test/features/authentication/presentation/login_view_model_test.dart`

**Interfaces:**
- Produces: `AuthSessionController.restore/signOut`.
- Produces: `LoginViewModel.submit(email, password)`.
- Produces: `RegisterViewModel.submit(name, email, password, confirmation)`.

- [ ] **Step 1: Write state transition test**

```dart
test('login transitions loading to authenticated', () async {
  final container = ProviderContainer(overrides: [
    authRepositoryProvider.overrideWithValue(FakeSuccessfulAuthRepository()),
  ]);
  addTearDown(container.dispose);
  await container.read(loginViewModelProvider.notifier).submit(
        email: 'user@example.com',
        password: 'Strong123',
      );
  expect(container.read(authSessionControllerProvider).value?.isAuthenticated, isTrue);
});
```

- [ ] **Step 2: Implement explicit form state**

Include `isSubmitting`, `fieldErrors`, and `submissionFailure`; do not expose raw exceptions.

- [ ] **Step 3: Implement ViewModels and test**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/features/authentication/presentation/login_view_model_test.dart
```

- [ ] **Step 4: Commit**

```bash
git add lib/features/authentication/presentation/view_models lib/features/authentication/presentation/states test/features/authentication/presentation
git commit -m "feat(auth): add session and form view models"
```

### Task 5: Build reusable authentication widgets and pages

**Files:**
- Create: `lib/features/authentication/presentation/widgets/auth_page_layout.dart`
- Create: `lib/features/authentication/presentation/widgets/auth_form_card.dart`
- Create: `lib/features/authentication/presentation/widgets/google_sign_in_button.dart`
- Create: pages for login, register, verify email, forgot password, reset password
- Test: `test/features/authentication/presentation/login_page_test.dart`

**Interfaces:**
- Consumes: form ViewModels.
- Produces: typed callbacks only; pages do not call repository.

- [ ] **Step 1: Write login page test**

```dart
testWidgets('shows localized validation for empty credentials', (tester) async {
  await tester.pumpWidget(authTestApp(const LoginPage()));
  await tester.tap(find.text('Sign in'));
  await tester.pump();
  expect(find.text('Email is required'), findsOneWidget);
});
```

- [ ] **Step 2: Implement shared form layout**

Use `AppTextField`, `AppPasswordField`, `AppPrimaryButton`, and `GoogleSignInButton`. Preserve LTR direction inside email fields in Arabic mode.

- [ ] **Step 3: Build all pages with no duplicated form logic**

Each page owns only its field controllers and binds to a dedicated ViewModel.

- [ ] **Step 4: Test both locales**

```bash
flutter test test/features/authentication/presentation/login_page_test.dart
```

- [ ] **Step 5: Commit**

```bash
git add lib/features/authentication/presentation/pages lib/features/authentication/presentation/widgets test/features/authentication/presentation
git commit -m "feat(auth): add reusable authentication pages"
```

### Task 6: Add protected-route redirect and return location

**Files:**
- Modify: `lib/core/navigation/app_router.dart`
- Create: `lib/core/navigation/auth_redirect.dart`
- Test: `test/core/navigation/auth_redirect_test.dart`

**Interfaces:**
- Produces: `String? authRedirect({required AuthSession session, required GoRouterState state})`.

- [ ] **Step 1: Write redirect tests**

```dart
test('guest opening wallet is redirected to login with return path', () {
  final location = authRedirect(
    session: const AuthSession.guest(),
    state: fakeState('/wallet'),
  );
  expect(location, '/auth/login?returnTo=%2Fwallet');
});
```

- [ ] **Step 2: Implement protected path policy**

Protect `/favorites`, `/checkout`, `/wallet`, `/orders`, `/notifications`, and `/profile/edit`.

- [ ] **Step 3: Implement successful return navigation**

After authentication, validate that `returnTo` is an internal path before calling `context.go(returnTo)`.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/core/navigation/auth_redirect_test.dart
git add lib/core/navigation test/core/navigation
git commit -m "feat(auth): protect routes and restore intended destination"
```

### Task 7: Add authentication integration tests

**Files:**
- Create: `integration_test/authentication_flow_test.dart`

**Interfaces:**
- Verifies: register → unverified → verify → authenticated.
- Verifies: guest wallet → login → wallet.
- Verifies: forgot password request and reset form.

- [ ] **Step 1: Write guest redirect flow**

```dart
testWidgets('guest signs in and returns to wallet', (tester) async {
  app.main();
  await tester.pumpAndSettle();
  await tester.tap(find.text('Wallet'));
  await tester.pumpAndSettle();
  expect(find.byType(LoginPage), findsOneWidget);
  await tester.enterText(find.byKey(const Key('email-field')), 'user@example.com');
  await tester.enterText(find.byKey(const Key('password-field')), 'Strong123');
  await tester.tap(find.text('Sign in'));
  await tester.pumpAndSettle();
  expect(find.byKey(const Key('wallet-page')), findsOneWidget);
});
```

- [ ] **Step 2: Run complete authentication suite**

```bash
flutter test test/features/authentication
flutter test integration_test/authentication_flow_test.dart
flutter analyze
```

- [ ] **Step 3: Commit**

```bash
git add integration_test/authentication_flow_test.dart
git commit -m "test(auth): cover complete authentication flows"
```


---

# Flutter Catalog and Cart Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement Home, Catalog, Product Details, Options, Favorites, and Cart, using Mock data, local read cache, and clear Offline states.

**Architecture:** The Home, Catalog, and Product Details features share a unified Product entity within `shared/domain/catalog`. Favorites and Cart remain with independent contracts, and shared product Widgets are used in `shared/presentation/widgets`.

**Tech Stack:** Riverpod, Freezed, Drift, cached_network_image, flutter_svg, go_router, mocktail.

## Global Constraints

- No pricing or option logic inside Widgets.
- Cart product is identified by productId + optionSignature.
- Favorites are associated with the product only.
- Readable data can be displayed Offline, and purchase is disabled Offline.
- Visual contract: `doc/specs/2026-08-01-ui-design-system.md`.
- Home uses the approved search/banner/category/offer/product rhythm while preserving Repository → ViewModel → Page data flow.
- ProductCard variants, layered radius-40 details, and radius-30 cart summary use semantic theme roles only.

---

### Task 1: Define shared catalog entities and money value object

**Files:**
- Create: `lib/shared/domain/money/money.dart`
- Create: `lib/shared/domain/catalog/product.dart`
- Create: `lib/shared/domain/catalog/category.dart`
- Create: `lib/shared/domain/catalog/product_option_group.dart`
- Test: `test/shared/domain/money_test.dart`

**Interfaces:**
- Produces: `Money(currencyCode: 'SDG', minorUnits: int)`.
- Produces: immutable Product and option entities.

- [ ] **Step 1: Write money tests**

```dart
test('adds amounts with the same currency', () {
  const left = Money.sdg(500000);
  const right = Money.sdg(100000);
  expect((left + right).minorUnits, 600000);
});

test('rejects mixed currencies', () {
  expect(() => const Money('SDG', 1) + const Money('USD', 1), throwsStateError);
});
```

- [ ] **Step 2: Implement Money without double**

Store SDG values in hundredths: 5,000.00 SDG = `500000` minor units.

- [ ] **Step 3: Implement Product entities**

Include bilingual names, media, base price, compare-at price, rating, review count, stock status, featured flag, option groups, and option values.

- [ ] **Step 4: Generate, test, commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/shared/domain/money_test.dart
git add lib/shared/domain test/shared/domain
git commit -m "feat(catalog): add shared product and money domain"
```

### Task 2: Implement catalog Mock repository and local read cache

**Files:**
- Create: `lib/features/catalog/domain/repositories/catalog_repository.dart`
- Create: `lib/features/catalog/data/mock/catalog_mock_data.dart`
- Create: `lib/features/catalog/data/repositories/mock_catalog_repository.dart`
- Create: `lib/features/catalog/data/data_sources/catalog_local_data_source.dart`
- Test: `test/features/catalog/data/mock_catalog_repository_test.dart`

**Interfaces:**
- Produces: `getHomeFeed`, `getProducts`, `getProductById`, `getCategories`.
- Produces: cache write/read methods for catalog snapshots.

- [ ] **Step 1: Write repository tests**

Assert deterministic products matching supplied screens, including Google One + Gemini Pro at 135,000 SDG and compare-at 399,000 SDG.

- [ ] **Step 2: Implement Mock feed**

Provide banners, categories, featured products, ratings, stock badges, and option groups.

- [ ] **Step 3: Implement cache policy**

On successful mock read, persist snapshot and timestamp. When Offline, return cache with `isStale: true`; if no cache, return `OfflineFailure`.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/catalog/data/mock_catalog_repository_test.dart
git add lib/features/catalog test/features/catalog
git commit -m "feat(catalog): add mock repository and offline read cache"
```

### Task 3: Build shared product widgets

**Files:**
- Create: `lib/shared/presentation/widgets/product_card.dart`
- Create: `lib/shared/presentation/widgets/product_horizontal_card.dart`
- Create: `lib/shared/presentation/widgets/product_price.dart`
- Create: `lib/shared/presentation/widgets/product_rating.dart`
- Create: `lib/shared/presentation/widgets/favorite_button.dart`
- Test: `test/shared/presentation/product_card_test.dart`

**Interfaces:**
- Produces: widgets with plain data and callbacks, no provider reads.

- [ ] **Step 1: Write card rendering test**

```dart
testWidgets('renders discounted price and featured badge', (tester) async {
  await tester.pumpWidget(testApp(ProductCard(product: fixtureProduct, onTap: () {})));
  expect(find.text('135,000 SDG'), findsOneWidget);
  expect(find.text('399,000 SDG'), findsOneWidget);
  expect(find.text('Featured'), findsOneWidget);
});
```

- [ ] **Step 2: Implement cards using design tokens**

Use `AppNetworkImage`, `ProductPrice`, `ProductRating`, and `FavoriteButton`; support compact and grid variants through typed constructors.

- [ ] **Step 3: Test RTL/LTR and commit**

```bash
flutter test test/shared/presentation/product_card_test.dart
git add lib/shared/presentation/widgets test/shared/presentation
git commit -m "feat(ui): add reusable product widgets"
```

### Task 4: Implement Home page composition

**Files:**
- Create: `lib/features/home/domain/entities/home_feed.dart`
- Create: `lib/features/home/presentation/view_models/home_view_model.dart`
- Create: widgets `home_header.dart`, `home_search_field.dart`, `hero_carousel.dart`, `trust_benefits.dart`, `category_section.dart`, `exclusive_offers.dart`
- Modify: `lib/features/home/presentation/pages/home_page.dart`
- Test: `test/features/home/presentation/home_page_test.dart`

**Interfaces:**
- Produces: `HomeViewModel.refresh()` and `selectCategory(String?)`.

- [ ] **Step 1: Write page state tests**

Test success, loading, offline-cache banner, and empty offers.

- [ ] **Step 2: Implement ViewModel**

Keep selected category separate from fetched feed and derive filtered offers via provider.

- [ ] **Step 3: Compose thin page**

`HomePage` composes six widgets and contains no raw styling or repository calls.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/home/presentation/home_page_test.dart
git add lib/features/home test/features/home
git commit -m "feat(home): build marketplace home page"
```

### Task 5: Implement product option selection and pricing

**Files:**
- Create: `lib/features/product_details/domain/entities/product_selection.dart`
- Create: `lib/features/product_details/domain/use_cases/resolve_product_selection.dart`
- Create: `lib/features/product_details/presentation/view_models/product_details_view_model.dart`
- Test: `test/features/product_details/domain/resolve_product_selection_test.dart`

**Interfaces:**
- Produces: `ProductSelection(optionValueIds, optionSignature, resolvedPrice, isComplete)`.
- Produces: stable sorted option signature.

- [ ] **Step 1: Write option resolution tests**

```dart
test('selection is incomplete until all required groups are selected', () {
  final result = useCase(product: fixtureProduct, selectedValueIds: const {'year'});
  expect(result.isComplete, isFalse);
  expect(result.selectedRequiredCount, 1);
});
```

- [ ] **Step 2: Implement deterministic signature**

```dart
final signature = [...selectedValueIds]..sort();
return signature.join(':');
```

- [ ] **Step 3: Implement price resolution in domain**

Use base price plus option deltas; never calculate inside UI.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/product_details/domain/resolve_product_selection_test.dart
git add lib/features/product_details/domain lib/features/product_details/presentation/view_models test/features/product_details/domain
git commit -m "feat(product): resolve required options and variant pricing"
```

### Task 6: Build Product Details page

**Files:**
- Create: `lib/features/product_details/presentation/pages/product_details_page.dart`
- Create: widgets `product_hero.dart`, `product_metadata_card.dart`, `product_option_group.dart`, `selection_validation_message.dart`, `purchase_bar.dart`
- Test: `test/features/product_details/presentation/product_details_page_test.dart`

**Interfaces:**
- Consumes: ProductDetailsViewModel.
- Produces: callbacks `addToCart()` and `buyNow()` only when selection complete.

- [ ] **Step 1: Write disabled purchase test**

Ensure `Add to Cart` and `Buy Now` are disabled when required selections are incomplete.

- [ ] **Step 2: Implement sticky purchase bar**

Place above bottom safe area; reflect resolved price and selection count.

- [ ] **Step 3: Test light/RTL and commit**

```bash
flutter test test/features/product_details/presentation/product_details_page_test.dart
git add lib/features/product_details/presentation test/features/product_details/presentation
git commit -m "feat(product): add product details and option selection ui"
```

### Task 7: Implement Favorites feature

**Files:**
- Create: `lib/features/favorites/domain/repositories/favorites_repository.dart`
- Create: `lib/features/favorites/data/repositories/mock_favorites_repository.dart`
- Create: `lib/features/favorites/presentation/view_models/favorites_view_model.dart`
- Create: `lib/features/favorites/presentation/pages/favorites_page.dart`
- Test: `test/features/favorites/favorites_view_model_test.dart`

**Interfaces:**
- Produces: `toggleFavorite(productId)` with optimistic update and rollback.

- [ ] **Step 1: Write optimistic update test**

Verify product disappears immediately and returns if repository returns failure.

- [ ] **Step 2: Implement repository uniqueness**

Use `Set<String>` product IDs in Mock storage.

- [ ] **Step 3: Compose page with ProductCard grid and Empty State**

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/favorites
git add lib/features/favorites test/features/favorites
git commit -m "feat(favorites): add optimistic favorites management"
```

### Task 8: Implement Cart domain and screens

**Files:**
- Create: `lib/features/cart/domain/entities/cart.dart`
- Create: `lib/features/cart/domain/entities/cart_item.dart`
- Create: `lib/features/cart/domain/repositories/cart_repository.dart`
- Create: `lib/features/cart/data/repositories/mock_cart_repository.dart`
- Create: `lib/features/cart/presentation/view_models/cart_view_model.dart`
- Create: `lib/features/cart/presentation/pages/cart_page.dart`
- Create: widgets `empty_cart_content.dart`, `cart_item_tile.dart`, `cart_summary_bar.dart`
- Test: `test/features/cart/cart_view_model_test.dart`

**Interfaces:**
- Produces: add, remove, update quantity, clear.
- Enforces: `productId + optionSignature` identity.

- [ ] **Step 1: Write merge identity test**

Same product and signature increments quantity; same product with different signature creates a new line.

- [ ] **Step 2: Implement repository and ViewModel**

Reject quantity below 1 and keep subtotal in Money.

- [ ] **Step 3: Build empty and populated states**

Empty state matches supplied illustration layout; populated state uses shared product widgets and sticky summary.

- [ ] **Step 4: Run full catalog flow test**

```bash
flutter test test/features/catalog test/features/product_details test/features/favorites test/features/cart
flutter analyze
```

- [ ] **Step 5: Commit**

```bash
git add lib/features/cart test/features/cart
git commit -m "feat(cart): add option aware cart and empty state"
```


---

# Flutter Checkout and Payments Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement complete Checkout with Mock data including order summary, coupon, referral, partial wallet usage, Bravo, CashilPay, and bank transfer with operation number and receipt image.

**Architecture:** Domain keeps all pricing and financial calculations. CheckoutViewModel displays a single source of truth CheckoutQuote, and the Checkout interface acts as a Draggable Bottom Sheet composed of shared Widgets.

**Tech Stack:** Riverpod, Freezed, Money value object, image_picker/file_picker, go_router, mocktail.

## Global Constraints

- Do not use double for money.
- Each Quote comes from a Use Case/Repository, not from a Widget.
- Financial operations are forbidden in Offline mode.
- Bank transfer is not considered paid; its status is `pendingReview`.
- Visual contract: `doc/specs/2026-08-01-ui-design-system.md`.
- Checkout uses the shared radius-30 AppBottomSheet, grouped cards, typed selection states, and keyboard-safe sticky actions.
- Financial UI is verified in both themes/directions at 200% text and never consumes `double` money.

---

### Task 1: Define checkout entities and quote contract

**Files:**
- Create: `lib/features/checkout/domain/entities/checkout_item.dart`
- Create: `lib/features/checkout/domain/entities/checkout_quote.dart`
- Create: `lib/features/checkout/domain/entities/payment_method.dart`
- Create: `lib/features/checkout/domain/repositories/checkout_repository.dart`
- Test: `test/features/checkout/domain/checkout_quote_test.dart`

**Interfaces:**
- Produces: subtotal, discounts, walletApplied, externalPayable, grandTotal.

- [ ] **Step 1: Write invariant tests**

```dart
test('external payable never becomes negative', () {
  final quote = CheckoutQuote.calculate(
    subtotal: const Money.sdg(1000000),
    discount: const Money.sdg(0),
    walletBalance: const Money.sdg(2000000),
    useWallet: true,
  );
  expect(quote.externalPayable.minorUnits, 0);
});
```

- [ ] **Step 2: Implement quote invariants**

Enforce same currency, non-negative amounts, and `walletApplied <= amountAfterDiscount`.

- [ ] **Step 3: Implement repository contract**

Methods: create quote, apply coupon, apply referral, load payment methods, load banks, submit bank transfer.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/checkout/domain/checkout_quote_test.dart
git add lib/features/checkout/domain test/features/checkout/domain
git commit -m "feat(checkout): define quote and payment domain"
```

### Task 2: Implement coupon, referral, and wallet allocation rules

**Files:**
- Create: `lib/features/checkout/domain/use_cases/build_checkout_quote.dart`
- Create: `lib/features/checkout/domain/use_cases/apply_promotion.dart`
- Test: `test/features/checkout/domain/build_checkout_quote_test.dart`

**Interfaces:**
- Produces: deterministic rule ordering coupon → referral → wallet.

- [ ] **Step 1: Write rule ordering test**

For 135,000 SDG subtotal, 10,000 coupon, 5,000 referral, and 5,000 wallet, expect 115,000 SDG external payable.

- [ ] **Step 2: Implement promotion rules**

Define Mock coupon `SAVE10K` and referral `REF-A1B2C3`; return typed validation failures for invalid or expired codes.

- [ ] **Step 3: Verify exact calculations and commit**

```bash
flutter test test/features/checkout/domain/build_checkout_quote_test.dart
git add lib/features/checkout/domain/use_cases test/features/checkout/domain
git commit -m "feat(checkout): add promotion and wallet allocation rules"
```

### Task 3: Implement Mock payment methods and bank data

**Files:**
- Create: `lib/features/checkout/domain/entities/bank.dart`
- Create: `lib/features/checkout/domain/entities/bank_account.dart`
- Create: `lib/features/checkout/data/mock/checkout_mock_data.dart`
- Create: `lib/features/checkout/data/repositories/mock_checkout_repository.dart`
- Test: `test/features/checkout/data/mock_checkout_repository_test.dart`

**Interfaces:**
- Produces: Bravo, CashilPay, Bank Transfer.
- Produces: Bank of Khartoum, Faisal Islamic Bank, Omdurman National Bank, MB Bank.

- [ ] **Step 1: Write bank selection test**

Verify Bank of Khartoum account number equals `8199246` and is returned only after selecting that bank.

- [ ] **Step 2: Implement deterministic Mock data**

Include bilingual names, logos, instructions, beneficiary name, account number, and review duration.

- [ ] **Step 3: Test and commit**

```bash
flutter test test/features/checkout/data/mock_checkout_repository_test.dart
git add lib/features/checkout/data test/features/checkout/data
git commit -m "feat(checkout): add mock methods and bank accounts"
```

### Task 4: Implement Checkout ViewModel

**Files:**
- Create: `lib/features/checkout/presentation/states/checkout_state.dart`
- Create: `lib/features/checkout/presentation/view_models/checkout_view_model.dart`
- Test: `test/features/checkout/presentation/checkout_view_model_test.dart`

**Interfaces:**
- Produces methods: `applyCoupon`, `applyReferral`, `toggleWallet`, `selectPaymentMethod`, `selectBank`, `setOperationNumber`, `setReceipt`, `submit`.

- [ ] **Step 1: Write state transition tests**

Verify selecting bank transfer reveals bank state; toggling wallet recomputes quote; invalid coupon preserves prior valid quote.

- [ ] **Step 2: Implement state as a single immutable source**

Include quote, payment methods, selected method, banks, selected bank, operation number, receipt, field errors, and submission status.

- [ ] **Step 3: Block transactional methods Offline**

Read NetworkStatus before apply/submit and return localized `OfflineFailure` state.

- [ ] **Step 4: Test and commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/features/checkout/presentation/checkout_view_model_test.dart
git add lib/features/checkout/presentation/states lib/features/checkout/presentation/view_models test/features/checkout/presentation
git commit -m "feat(checkout): add checkout state orchestration"
```

### Task 5: Build shared payment widgets

**Files:**
- Create: `lib/shared/presentation/widgets/payment_method_tile.dart`
- Create: `lib/shared/presentation/widgets/bank_selector_tile.dart`
- Create: `lib/shared/presentation/widgets/bank_details_card.dart`
- Create: `lib/shared/presentation/widgets/price_summary.dart`
- Create: `lib/shared/presentation/widgets/apply_code_field.dart`
- Create: `lib/shared/presentation/widgets/receipt_uploader.dart`
- Test: `test/shared/presentation/payment_method_tile_test.dart`

**Interfaces:**
- Widgets receive data and callbacks only.

- [ ] **Step 1: Write selected/unselected tile tests**

Verify selected tile uses semantic `selected: true`, brand border, and radio state.

- [ ] **Step 2: Implement widgets with typed variants**

`ApplyCodeField` exposes `isApplying`, `errorText`, and `onApply`; `ReceiptUploader` exposes selected file metadata without performing upload itself.

- [ ] **Step 3: Test RTL/LTR and commit**

```bash
flutter test test/shared/presentation/payment_method_tile_test.dart
git add lib/shared/presentation/widgets test/shared/presentation
git commit -m "feat(ui): add reusable checkout payment widgets"
```

### Task 6: Build Checkout Bottom Sheet

**Files:**
- Create: `lib/features/checkout/presentation/pages/checkout_page.dart`
- Create: `lib/features/checkout/presentation/widgets/checkout_sheet.dart`
- Create: `lib/features/checkout/presentation/widgets/order_summary_card.dart`
- Create: `lib/features/checkout/presentation/widgets/wallet_usage_tile.dart`
- Create: `lib/features/checkout/presentation/widgets/bank_transfer_form.dart`
- Test: `test/features/checkout/presentation/checkout_sheet_test.dart`

**Interfaces:**
- Consumes: CheckoutViewModel only.
- Produces: responsive scrollable sheet with keyboard-safe bottom padding.

- [ ] **Step 1: Write product checkout rendering test**

Assert product title, old/current price, coupon, referral, wallet, three payment methods, and bank form after selection.

- [ ] **Step 2: Implement `DraggableScrollableSheet` composition**

Use `AppBottomSheet`, `AppModalHandle`, shared widgets, and `AnimatedSwitcher` for payment forms.

- [ ] **Step 3: Validate operation and receipt fields**

Submit remains disabled until bank, non-empty operation number, and receipt are present.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/checkout/presentation/checkout_sheet_test.dart
git add lib/features/checkout/presentation/pages lib/features/checkout/presentation/widgets test/features/checkout/presentation
git commit -m "feat(checkout): build responsive checkout bottom sheet"
```

### Task 7: Implement bank receipt selection and submission state

**Files:**
- Create: `lib/core/files/picked_file.dart`
- Create: `lib/core/files/file_picker_service.dart`
- Create: `lib/features/checkout/domain/entities/bank_transfer_submission.dart`
- Test: `test/features/checkout/domain/bank_transfer_submission_test.dart`

**Interfaces:**
- Produces: allowed MIME types JPEG, PNG, WebP, PDF.
- Produces: maximum file size 10 MB.

- [ ] **Step 1: Write invalid file tests**

Reject executable MIME and files over 10 MB.

- [ ] **Step 2: Implement file metadata validation**

Do not upload bytes in the ViewModel; store `PickedFile(path, name, mimeType, sizeBytes)`.

- [ ] **Step 3: Implement Mock submission result**

Return `BankTransferStatus.pendingReview` with generated local reference.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/checkout/domain/bank_transfer_submission_test.dart
git add lib/core/files lib/features/checkout/domain/entities test/features/checkout/domain
git commit -m "feat(payments): validate and submit bank transfer evidence"
```

### Task 8: Add checkout integration tests

**Files:**
- Create: `integration_test/product_checkout_flow_test.dart`

**Interfaces:**
- Verifies: product option → buy now → coupon/referral → wallet → bank transfer → pending review.

- [ ] **Step 1: Write complete flow**

Use stable keys for option values, coupon/referral fields, wallet switch, bank tile, operation field, receipt picker fake, and submit button.

- [ ] **Step 2: Run full suite**

```bash
flutter test test/features/checkout
flutter test integration_test/product_checkout_flow_test.dart
flutter analyze
```

- [ ] **Step 3: Commit**

```bash
git add integration_test/product_checkout_flow_test.dart
git commit -m "test(checkout): cover mixed wallet and bank transfer flow"
```


---

# Flutter Wallet Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement wallet dashboard, hide/show balance, transaction history, top-up sheet, quick amounts, and navigation to bank transfer payment with Mock data.

**Architecture:** The wallet displays a Ledger-style read model independently, while the top-up operation creates a WalletTopUp Checkout and does not modify the balance before Mock payment approval. All financial operations are disabled in Offline mode.

**Tech Stack:** Riverpod, Freezed, shared Money, checkout shared widgets, go_router, mocktail.

## Global Constraints

- The minimum top-up is 5,000 SDG.
- Quick amounts: 5K, 10K, 20K, 50K, 100K, 200K.
- Do not allow using the wallet to pay for wallet top-up.
- The transaction history is not modified from the UI.
- Visual contract: `doc/specs/2026-08-01-ui-design-system.md`.
- Wallet uses semantic promotional surfaces; transaction direction is shown by icon, sign, and text as well as color.
- Hidden balance, Offline, Light/Dark, RTL/LTR, 48×48, and 200% text states are required.

---

### Task 1: Define wallet entities and contracts

**Files:**
- Create: `lib/features/wallet/domain/entities/wallet.dart`
- Create: `lib/features/wallet/domain/entities/wallet_transaction.dart`
- Create: `lib/features/wallet/domain/entities/wallet_topup.dart`
- Create: `lib/features/wallet/domain/repositories/wallet_repository.dart`
- Test: `test/features/wallet/domain/wallet_topup_test.dart`

**Interfaces:**
- Produces: wallet status active/frozen/closed.
- Produces: transaction types creditGift, creditTopup, creditRefund, debitOrder, hold, release.

- [ ] **Step 1: Write top-up validation tests**

```dart
test('rejects amount below 5000 SDG', () {
  expect(() => WalletTopupAmount.create(const Money.sdg(499900)), throwsA(isA<FormatException>()));
});
```

- [ ] **Step 2: Implement entities and repository contract**

Repository methods: getWallet, getTransactions(page), createTopup(amount), refresh.

- [ ] **Step 3: Test and commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/features/wallet/domain/wallet_topup_test.dart
git add lib/features/wallet/domain test/features/wallet/domain
git commit -m "feat(wallet): define wallet ledger domain"
```

### Task 2: Implement Mock wallet repository

**Files:**
- Create: `lib/features/wallet/data/mock/wallet_mock_data.dart`
- Create: `lib/features/wallet/data/repositories/mock_wallet_repository.dart`
- Test: `test/features/wallet/data/mock_wallet_repository_test.dart`

**Interfaces:**
- Produces: current balance 5,000 SDG and welcome gift transaction.
- Produces: `createTopup(10,000 SDG)` returning a checkout seed.

- [ ] **Step 1: Write fixture tests**

Assert transaction label, date, direction, and amount exactly match the supplied screen data.

- [ ] **Step 2: Implement deterministic pagination**

Use page size 20 and stable sort descending by createdAt.

- [ ] **Step 3: Test and commit**

```bash
flutter test test/features/wallet/data/mock_wallet_repository_test.dart
git add lib/features/wallet/data test/features/wallet/data
git commit -m "feat(wallet): add mock wallet and transaction ledger"
```

### Task 3: Implement Wallet ViewModel

**Files:**
- Create: `lib/features/wallet/presentation/states/wallet_state.dart`
- Create: `lib/features/wallet/presentation/view_models/wallet_view_model.dart`
- Test: `test/features/wallet/presentation/wallet_view_model_test.dart`

**Interfaces:**
- Produces: refresh, loadNextPage, toggleBalanceVisibility, beginTopup.

- [ ] **Step 1: Write visibility persistence test**

Verify toggling hides only presentation value and does not change wallet entity.

- [ ] **Step 2: Implement async loading and pagination**

Prevent duplicate next-page requests while one is in progress.

- [ ] **Step 3: Test and commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/features/wallet/presentation/wallet_view_model_test.dart
git add lib/features/wallet/presentation/states lib/features/wallet/presentation/view_models test/features/wallet/presentation
git commit -m "feat(wallet): add wallet dashboard state management"
```

### Task 4: Build Wallet dashboard widgets and page

**Files:**
- Create: `lib/features/wallet/presentation/pages/wallet_page.dart`
- Create: widgets `wallet_app_bar.dart`, `wallet_balance_card.dart`, `wallet_status_badge.dart`, `charge_wallet_tile.dart`, `wallet_transaction_list.dart`, `wallet_transaction_tile.dart`
- Test: `test/features/wallet/presentation/wallet_page_test.dart`

**Interfaces:**
- Page watches only WalletViewModel and composes widgets.

- [ ] **Step 1: Write rendering test**

Assert `SDG 5,000.00`, Active badge, Charge Now, and welcome gift transaction.

- [ ] **Step 2: Implement balance hide/show and refresh**

Use semantics labels for the eye button and pull-to-refresh.

- [ ] **Step 3: Test dark RTL/LTR and commit**

```bash
flutter test test/features/wallet/presentation/wallet_page_test.dart
git add lib/features/wallet/presentation/pages lib/features/wallet/presentation/widgets test/features/wallet/presentation
git commit -m "feat(wallet): build wallet dashboard ui"
```

### Task 5: Implement Wallet Top-up ViewModel

**Files:**
- Create: `lib/features/wallet/presentation/states/wallet_topup_state.dart`
- Create: `lib/features/wallet/presentation/view_models/wallet_topup_view_model.dart`
- Test: `test/features/wallet/presentation/wallet_topup_view_model_test.dart`

**Interfaces:**
- Produces: `setAmount`, `selectQuickAmount`, `submit`.

- [ ] **Step 1: Write quick amount test**

Selecting 10,000 SDG updates amount field and enables Charge Now.

- [ ] **Step 2: Implement validation and Offline guard**

Do not navigate on invalid or Offline submission.

- [ ] **Step 3: Test and commit**

```bash
flutter test test/features/wallet/presentation/wallet_topup_view_model_test.dart
git add lib/features/wallet/presentation/states lib/features/wallet/presentation/view_models test/features/wallet/presentation
git commit -m "feat(wallet): add topup form state and validation"
```

### Task 6: Build Wallet Top-up Bottom Sheet

**Files:**
- Create: `lib/features/wallet/presentation/widgets/wallet_topup_sheet.dart`
- Create: `lib/features/wallet/presentation/widgets/topup_amount_field.dart`
- Create: `lib/features/wallet/presentation/widgets/quick_amount_grid.dart`
- Test: `test/features/wallet/presentation/wallet_topup_sheet_test.dart`

**Interfaces:**
- Consumes: WalletTopupViewModel.
- Produces: checkout route seed with type walletTopup.

- [ ] **Step 1: Write layout and validation test**

Assert six quick amounts, minimum message, amount field, and disabled CTA below minimum.

- [ ] **Step 2: Implement bottom sheet**

Use shared modal components and numeric keyboard; keep currency suffix LTR.

- [ ] **Step 3: Test and commit**

```bash
flutter test test/features/wallet/presentation/wallet_topup_sheet_test.dart
git add lib/features/wallet/presentation/widgets test/features/wallet/presentation
git commit -m "feat(wallet): build reusable wallet topup sheet"
```

### Task 7: Connect top-up to checkout and pending review

**Files:**
- Modify: `lib/features/checkout/domain/entities/checkout_item.dart`
- Modify: `lib/features/checkout/presentation/view_models/checkout_view_model.dart`
- Create: `integration_test/wallet_topup_flow_test.dart`

**Interfaces:**
- Checkout supports `CheckoutPurpose.productPurchase` and `CheckoutPurpose.walletTopup`.
- Wallet toggle hidden for walletTopup.

- [ ] **Step 1: Write integration flow**

Wallet → Charge Now → 10,000 → Bank Transfer → bank → operation number → receipt → pending review.

- [ ] **Step 2: Implement purpose-specific checkout behavior**

Hide coupon/referral only if product rules require; always hide wallet usage for wallet top-up.

- [ ] **Step 3: Run and commit**

```bash
flutter test test/features/wallet test/features/checkout
flutter test integration_test/wallet_topup_flow_test.dart
flutter analyze
git add lib/features/checkout integration_test/wallet_topup_flow_test.dart
git commit -m "feat(wallet): connect topup to bank transfer checkout"
```


---

# Flutter Profile and Settings Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement profile page, statistics, account data editing, password change, language, theme, notification settings, and log out routine.

**Architecture:** Profile data is separated from App settings. It uses LocaleController and ThemeController from Foundation, while ProfileRepository displays mock user data and statistics.

**Tech Stack:** Riverpod, Freezed, shared_preferences, auth session controller, go_router, image picker contract.

## Global Constraints

- Do not repeat the password change section.
- Email and names are subject to validation.
- Password change is optional; if a new password is entered, both the current and confirmation are required.
- Language and theme are applied during operation.
- Visual contract: `doc/specs/2026-08-01-ui-design-system.md`.
- Profile uses circular avatar/edit action, grouped muted settings tiles, directional arrows, and a destructive confirmation sheet.
- Locale/theme preferences are persisted and visual tests cover both themes/directions at 200% text.

---

### Task 1: Define profile and settings domain

**Files:**
- Create: `lib/features/profile/domain/entities/user_profile.dart`
- Create: `lib/features/profile/domain/entities/profile_stats.dart`
- Create: `lib/features/profile/domain/repositories/profile_repository.dart`
- Create: `lib/features/settings/domain/entities/notification_preferences.dart`
- Test: `test/features/profile/domain/user_profile_test.dart`

**Interfaces:**
- Produces: profile update and password change contracts.

- [ ] **Step 1: Write display name test**

Ensure trimmed display name cannot be empty.

- [ ] **Step 2: Implement entities and contracts**

Profile fields: firstName, lastName, displayName, email, avatarUrl; stats: orders, favorites, referrals, unreadNotifications.

- [ ] **Step 3: Test and commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/features/profile/domain/user_profile_test.dart
git add lib/features/profile/domain lib/features/settings/domain test/features/profile/domain
git commit -m "feat(profile): define profile and settings domain"
```

### Task 2: Implement Mock profile repository

**Files:**
- Create: `lib/features/profile/data/mock/profile_mock_data.dart`
- Create: `lib/features/profile/data/repositories/mock_profile_repository.dart`
- Test: `test/features/profile/data/mock_profile_repository_test.dart`

**Interfaces:**
- Produces: fahmi / fareed / fahmifareed@gmail.com and stats 0/1/referrals/36.

- [ ] **Step 1: Write fixture test**

Assert exact values and successful profile update persistence in memory.

- [ ] **Step 2: Implement password validation behavior**

Current password fixture is `Strong123`; return `UnauthorizedFailure` for mismatch.

- [ ] **Step 3: Test and commit**

```bash
flutter test test/features/profile/data/mock_profile_repository_test.dart
git add lib/features/profile/data test/features/profile/data
git commit -m "feat(profile): add mock profile repository"
```

### Task 3: Implement Profile ViewModel and page

**Files:**
- Create: `lib/features/profile/presentation/view_models/profile_view_model.dart`
- Create: `lib/features/profile/presentation/pages/profile_page.dart`
- Create: widgets `user_summary_card.dart`, `profile_stats_grid.dart`, `settings_group.dart`, `settings_tile.dart`, `logout_tile.dart`
- Test: `test/features/profile/presentation/profile_page_test.dart`

**Interfaces:**
- Produces: refresh and logout actions.

- [ ] **Step 1: Write page test**

Assert user card, four stats, settings section, support section, and logout tile.

- [ ] **Step 2: Implement thin page composition**

Use `UserAvatar`, `NotificationBadge`, and feature-local setting widgets.

- [ ] **Step 3: Test dark/English and dark/Arabic**

```bash
flutter test test/features/profile/presentation/profile_page_test.dart
```

- [ ] **Step 4: Commit**

```bash
git add lib/features/profile/presentation test/features/profile/presentation
git commit -m "feat(profile): build profile and settings hub"
```

### Task 4: Implement account edit form logic

**Files:**
- Create: `lib/features/profile/presentation/states/account_edit_state.dart`
- Create: `lib/features/profile/presentation/view_models/account_edit_view_model.dart`
- Test: `test/features/profile/presentation/account_edit_view_model_test.dart`

**Interfaces:**
- Produces: `saveProfile` and `changePassword` coordinated submit.

- [ ] **Step 1: Write optional password test**

Empty password fields update profile without calling changePassword.

- [ ] **Step 2: Write mismatch test**

New password and confirmation mismatch produces field error without repository call.

- [ ] **Step 3: Implement ViewModel and run tests**

```bash
flutter test test/features/profile/presentation/account_edit_view_model_test.dart
```

- [ ] **Step 4: Commit**

```bash
git add lib/features/profile/presentation/states lib/features/profile/presentation/view_models test/features/profile/presentation
git commit -m "feat(profile): add account edit and password logic"
```

### Task 5: Build Account Details page

**Files:**
- Create: `lib/features/profile/presentation/pages/account_details_page.dart`
- Create: widgets `personal_details_form.dart`, `change_password_form.dart`, `save_changes_bar.dart`
- Test: `test/features/profile/presentation/account_details_page_test.dart`

**Interfaces:**
- Consumes: AccountEditViewModel only.

- [ ] **Step 1: Write duplication regression test**

```dart
testWidgets('renders one change password section', (tester) async {
  await tester.pumpWidget(profileTestApp(const AccountDetailsPage()));
  expect(find.text('Change Password'), findsOneWidget);
});
```

- [ ] **Step 2: Implement keyboard-safe scroll and sticky save button**

Keep email field LTR under Arabic; expose password visibility toggles with semantics labels.

- [ ] **Step 3: Test and commit**

```bash
flutter test test/features/profile/presentation/account_details_page_test.dart
git add lib/features/profile/presentation/pages lib/features/profile/presentation/widgets test/features/profile/presentation
git commit -m "feat(profile): build account details form"
```

### Task 6: Persist and apply language/theme preferences

**Files:**
- Modify: `lib/core/localization/locale_controller.dart`
- Modify: `lib/core/design_system/theme/theme_controller.dart`
- Create: `lib/features/settings/presentation/pages/language_settings_page.dart`
- Create: `lib/features/settings/presentation/pages/theme_settings_page.dart`
- Test: `test/features/settings/preferences_test.dart`

**Interfaces:**
- Consumes: PreferencesStore.
- Produces: persisted `ar/en` and `system/light/dark`.

- [ ] **Step 1: Write restore preference test**

Start container with stored `ar` and `dark`; verify controllers restore both.

- [ ] **Step 2: Implement persistence in controllers**

Save after valid change and load once during build.

- [ ] **Step 3: Build selection pages using radio tiles**

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/settings/preferences_test.dart
git add lib/core/localization lib/core/design_system/theme lib/features/settings/presentation test/features/settings
git commit -m "feat(settings): persist runtime locale and theme"
```

### Task 7: Implement notification preferences and logout confirmation

**Files:**
- Create: `lib/features/settings/presentation/view_models/notification_settings_view_model.dart`
- Create: `lib/features/settings/presentation/pages/notification_settings_page.dart`
- Create: `lib/features/profile/presentation/widgets/logout_confirmation_sheet.dart`
- Test: `test/features/settings/notification_settings_test.dart`

**Interfaces:**
- Produces: push, email, and marketing toggles.
- Consumes: AuthSessionController.signOut.

- [ ] **Step 1: Write toggle persistence test**

Toggle marketing notifications off and verify stored preference.

- [ ] **Step 2: Implement logout sheet**

Cancel leaves session unchanged; confirm signs out and navigates home as guest.

- [ ] **Step 3: Run tests and commit**

```bash
flutter test test/features/settings test/features/profile
flutter analyze
git add lib/features/settings lib/features/profile/presentation/widgets/logout_confirmation_sheet.dart test/features/settings
git commit -m "feat(settings): add notifications and safe logout"
```


---

# Flutter Phase 2 Features Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add Orders and details, Notifications center, Search and filters, Support, Privacy, and Information pages using the same architecture and Widgets.

**Architecture:** Each feature is independent with a Repository contract and Mock implementation, reusing ProductCard, AppAsyncValueBuilder, SettingsTile, and existing system components.

**Tech Stack:** Riverpod, Freezed, go_router, Drift read cache, intl, shared design system.

## Global Constraints

- Do not duplicate Widgets from Phase 1; extract a shared widget when using it for the second time.
- Search works with 400ms debounce.
- Orders and notifications are protected by authentication.
- Policy pages read content locally from Assets in Mock version.
- Visual contract: `doc/specs/2026-08-01-ui-design-system.md`.
- Orders reuse AppCard/AppStatusBadge; Notifications reuse grouped tiles; Search uses AppSearchField; Filters use AppBottomSheet.
- Phase 2 introduces no feature-local palette or duplicate field/card/sheet language.

---

### Task 1: Implement Orders list and details

**Files:**
- Create: `lib/features/orders/domain/entities/order.dart`
- Create: `lib/features/orders/domain/repositories/orders_repository.dart`
- Create: `lib/features/orders/data/repositories/mock_orders_repository.dart`
- Create: `lib/features/orders/presentation/pages/orders_page.dart`
- Create: `lib/features/orders/presentation/pages/order_details_page.dart`
- Test: `test/features/orders/orders_flow_test.dart`

**Interfaces:**
- Produces: paginated orders and order-by-id.

- [ ] **Step 1: Write order status mapping tests**

Map pendingPayment, pendingVerification, paid, processing, completed, cancelled, refunded to localized badge variants.

- [ ] **Step 2: Implement repository and ViewModel**

Provide product purchase and wallet top-up fixtures.

- [ ] **Step 3: Build list/details widgets**

Use reusable `OrderStatusBadge`, `OrderItemTile`, and `PriceSummary`.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/orders
git add lib/features/orders test/features/orders
git commit -m "feat(orders): add order history and details"
```

### Task 2: Implement Notifications center

**Files:**
- Create: `lib/features/notifications/domain/entities/app_notification.dart`
- Create: `lib/features/notifications/domain/repositories/notifications_repository.dart`
- Create: `lib/features/notifications/data/repositories/mock_notifications_repository.dart`
- Create: `lib/features/notifications/presentation/pages/notifications_page.dart`
- Test: `test/features/notifications/notifications_view_model_test.dart`

**Interfaces:**
- Produces: unread count, mark read, mark all read, pagination.

- [ ] **Step 1: Write unread count tests**

Marking one notification read decrements count exactly once.

- [ ] **Step 2: Implement optimistic read state with rollback**

- [ ] **Step 3: Build grouped list by date**

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/notifications
git add lib/features/notifications test/features/notifications
git commit -m "feat(notifications): add notification center"
```

### Task 3: Implement debounced search

**Files:**
- Create: `lib/features/search/domain/entities/search_query.dart`
- Create: `lib/features/search/domain/repositories/search_repository.dart`
- Create: `lib/features/search/presentation/view_models/search_view_model.dart`
- Create: `lib/features/search/presentation/pages/search_page.dart`
- Test: `test/features/search/search_view_model_test.dart`

**Interfaces:**
- Produces: query, results, recent searches, isSearching.

- [ ] **Step 1: Write debounce test with fake async**

Verify repository is called once after 400ms for rapid text changes.

- [ ] **Step 2: Implement search over Mock catalog**

Search bilingual names and categories case-insensitively.

- [ ] **Step 3: Build recent/empty/results states**

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/search
git add lib/features/search test/features/search
git commit -m "feat(search): add debounced bilingual product search"
```

### Task 4: Implement advanced filters

**Files:**
- Create: `lib/features/search/domain/entities/product_filter.dart`
- Create: `lib/features/search/presentation/widgets/filter_bottom_sheet.dart`
- Test: `test/features/search/product_filter_test.dart`

**Interfaces:**
- Filters: category, stock, featured, minPrice, maxPrice, minimumRating, sort order.

- [ ] **Step 1: Write filter composition tests**

Verify category + stock + price range are AND-combined.

- [ ] **Step 2: Implement immutable filter and clear/apply behavior**

- [ ] **Step 3: Build reusable filter controls**

Use design-system selectors and no raw Slider styling.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/search/product_filter_test.dart
git add lib/features/search test/features/search
git commit -m "feat(search): add advanced product filters"
```

### Task 5: Implement support and policy pages

**Files:**
- Create: `assets/content/privacy_policy_ar.md`
- Create: `assets/content/privacy_policy_en.md`
- Create: `assets/content/about_ar.md`
- Create: `assets/content/about_en.md`
- Create: `lib/features/support/presentation/pages/contact_us_page.dart`
- Create: `lib/features/support/presentation/pages/content_page.dart`
- Test: `test/features/support/content_page_test.dart`

**Interfaces:**
- Produces: localized asset content loader.

- [ ] **Step 1: Add non-empty localized content assets**

Write final app-specific copy; do not include dummy or generic copy.

- [ ] **Step 2: Implement content loader by locale**

Return typed `NotFoundFailure` if asset missing.

- [ ] **Step 3: Build Contact Us form with Mock success**

Fields: subject, message, optional order number.

- [ ] **Step 4: Test and commit**

```bash
flutter test test/features/support
git add assets/content lib/features/support test/features/support pubspec.yaml
git commit -m "feat(support): add contact and localized information pages"
```

### Task 6: Add Phase 2 integration test

**Files:**
- Create: `integration_test/phase_two_navigation_test.dart`

**Interfaces:**
- Verifies: profile → orders → details; notifications mark read; search → filters → product; privacy page locale switch.

- [ ] **Step 1: Implement flow with stable keys**

- [ ] **Step 2: Run complete phase suite**

```bash
flutter test test/features/orders test/features/notifications test/features/search test/features/support
flutter test integration_test/phase_two_navigation_test.dart
flutter analyze
```

- [ ] **Step 3: Commit**

```bash
git add integration_test/phase_two_navigation_test.dart
git commit -m "test(app): cover phase two feature navigation"
```


---

# Flutter Quality and Release Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ensure visual and functional quality, accessibility, performance, CI, and buildable Android and iOS release versions.

**Architecture:** Tests use Provider overrides and fixed Mock sources. Golden harness and integration drivers are separated from production code, and no real network is allowed during tests.

**Tech Stack:** flutter_test, integration_test, mocktail, golden tests, GitHub Actions, Flutter release builds.

## Global Constraints

- No ignored tests.
- Golden files are not updated without visual review.
- All financial flows are tested offline, during loading, and during failures.
- Successful `flutter analyze` is a condition for any Build.
- Visual acceptance follows `doc/specs/2026-08-01-ui-design-system.md`.
- Enforce 4.5:1 text contrast, 3:1 non-text contrast, 48×48 targets, three reference device sizes, and 200% text scaling.
- Golden coverage includes auth, orders/notifications, and Loading/Empty/Error/Offline states in meaningful theme/locale pairs.

---

### Task 1: Build a shared test harness

**Files:**
- Create: `test/helpers/test_app.dart`
- Create: `test/helpers/test_localizations.dart`
- Create: `test/helpers/test_provider_overrides.dart`
- Create: `test/helpers/test_devices.dart`

**Interfaces:**
- Produces: `testApp(widget, locale, themeMode, overrides)`.
- Produces device sizes 360×800, 390×844, 412×915.

- [ ] **Step 1: Write harness self-test**

Render a Text widget in Arabic dark mode and assert Directionality.rtl and Brightness.dark.

- [ ] **Step 2: Implement deterministic MediaQuery and ProviderScope**

- [ ] **Step 3: Run and commit**

```bash
flutter test test/helpers
git add test/helpers
git commit -m "test(core): add shared widget test harness"
```

### Task 2: Add Golden regression coverage

**Files:**
- Create: `test/goldens/home_golden_test.dart`
- Create: `test/goldens/product_details_golden_test.dart`
- Create: `test/goldens/checkout_golden_test.dart`
- Create: `test/goldens/wallet_golden_test.dart`
- Create: `test/goldens/profile_golden_test.dart`
- Create: `test/goldens/empty_cart_golden_test.dart`

**Interfaces:**
- Covers light/dark and ar/en combinations relevant to each supplied screen.

- [ ] **Step 1: Write deterministic golden tests**

Disable animations and use local asset fixtures; never load network images.

- [ ] **Step 2: Generate baselines**

```bash
flutter test --update-goldens test/goldens
```

- [ ] **Step 3: Review images manually**

Check spacing, typography, RTL order, clipping, and bottom safe areas against reference screenshots.

- [ ] **Step 4: Run without update and commit**

```bash
flutter test test/goldens
git add test/goldens
git commit -m "test(ui): add golden regression coverage"
```

### Task 3: Add accessibility tests

**Files:**
- Create: `test/accessibility/semantics_test.dart`
- Create: `test/accessibility/text_scaling_test.dart`

**Interfaces:**
- Verifies labels, selected states, tap targets, contrast-sensitive states, and text scaling to 200%.

- [ ] **Step 1: Test critical icon labels**

Back, close, favorite, hide balance, refresh, copy account, upload receipt, and password visibility must expose localized semantics.

- [ ] **Step 2: Test text scaling**

Render primary pages at textScaleFactor 2.0 and assert no exceptions/overflows.

- [ ] **Step 3: Run and commit**

```bash
flutter test test/accessibility
git add test/accessibility
git commit -m "test(a11y): verify semantics and text scaling"
```

### Task 4: Add complete integration matrix

**Files:**
- Create: `integration_test/app_smoke_test.dart`
- Modify existing integration tests to use shared driver helpers.

**Interfaces:**
- Covers auth, catalog, cart, checkout, wallet, profile/settings, and phase 2.

- [ ] **Step 1: Add cold-start smoke test**

Launch as guest, switch all five tabs, change locale/theme, and verify no crash.

- [ ] **Step 2: Run integration suite on Android emulator**

```bash
flutter test integration_test
```

- [ ] **Step 3: Run integration suite on iOS simulator**

```bash
flutter test integration_test -d ios
```

- [ ] **Step 4: Commit**

```bash
git add integration_test
git commit -m "test(app): complete mobile integration matrix"
```

### Task 5: Add CI workflow

**Files:**
- Create: `.github/workflows/flutter_ci.yml`

**Interfaces:**
- Runs format check, code generation verification, analyze, unit/widget/golden tests, and Android build.

- [ ] **Step 1: Add workflow**

```yaml
name: Flutter CI
on:
  pull_request:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.44.7'
          channel: stable
          cache: true
      - run: flutter pub get
      - run: dart run build_runner build --delete-conflicting-outputs
      - run: git diff --exit-code
      - run: dart format --output=none --set-exit-if-changed lib test integration_test
      - run: flutter analyze
      - run: flutter test --exclude-tags=golden
      - run: flutter test test/goldens
      - run: flutter build appbundle --debug
```

- [ ] **Step 2: Validate workflow locally**

Run every command in the same order and ensure no generated diff remains.

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/flutter_ci.yml
git commit -m "ci: add flutter analysis test and build pipeline"
```

### Task 6: Review performance and rebuild boundaries

**Files:**
- Modify: feature widgets and providers identified by profiling.
- Create: `docs/performance-checklist.md`

**Interfaces:**
- Target: smooth scrolling on product grids and checkout sheet without full-page rebuilds for field changes.

- [ ] **Step 1: Profile release-like build**

```bash
flutter run --profile
```

Inspect Home scroll, Favorites grid, Checkout typing, and Wallet list in DevTools.

- [ ] **Step 2: Apply targeted rebuild isolation**

Use `ref.watch(provider.select(...))`, const constructors, list item keys, and image cache dimensions only where profiling shows unnecessary work.

- [ ] **Step 3: Record verified results**

Document device, frame behavior, and corrected hotspots; do not claim numerical targets not measured.

- [ ] **Step 4: Test and commit**

```bash
flutter analyze
flutter test
git add lib docs/performance-checklist.md
git commit -m "perf: isolate verified high frequency rebuilds"
```

### Task 7: Configure Android and iOS release metadata

**Files:**
- Modify: `android/app/build.gradle.kts`
- Modify: `android/app/src/main/AndroidManifest.xml`
- Modify: `ios/Runner/Info.plist`
- Modify: `ios/Runner.xcodeproj/project.pbxproj`
- Create: `docs/release-checklist.md`

**Interfaces:**
- Produces: final application ID, display name, permissions, versioning, and asset declarations.

- [ ] **Step 1: Configure Android identifiers and permissions**

Use `com.rehlaa.mobile`; declare only internet and required file/photo picker permissions according to chosen plugin behavior.

- [ ] **Step 2: Configure iOS bundle and usage descriptions**

Use `com.rehlaa.mobile`; add localized photo library usage description only when receipt picker needs it.

- [ ] **Step 3: Verify builds**

```bash
flutter build appbundle --release
flutter build ipa --release --no-codesign
```

- [ ] **Step 4: Commit**

```bash
git add android ios docs/release-checklist.md
git commit -m "chore(release): configure android and ios release builds"
```

### Task 8: Final verification gate

**Files:**
- Modify only files required to fix verified failures.

**Interfaces:**
- Produces: release candidate with no known ignored failure.

- [ ] **Step 1: Clean and regenerate**

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

- [ ] **Step 2: Run static and automated checks**

```bash
dart format --output=none --set-exit-if-changed lib test integration_test
flutter analyze
flutter test
flutter test integration_test
```

- [ ] **Step 3: Build both platforms**

```bash
flutter build appbundle --release
flutter build ipa --release --no-codesign
```

- [ ] **Step 4: Commit verified release state**

```bash
git add .
git commit -m "chore(release): verify flutter mobile release candidate"
```


---
