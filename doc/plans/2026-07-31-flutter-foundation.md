# Flutter Architecture Foundation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** إنشاء أساس مشروع Flutter إنتاجي يدعم Android/iOS، العربية/الإنجليزية، Light/Dark، Riverpod، go_router، Design System، التخزين المحلي، وحالة الاتصال، مع Vertical Slice مثبتة بالاختبارات.

**Architecture:** Feature-first Clean MVVM مع مزودات Riverpod مولدة، نماذج immutable، Repository contracts، ومكونات Design System مركزية. يثبت هذا الأساس الحدود المعمارية قبل إضافة ميزات التطبيق.

**Tech Stack:** Flutter 3.44.x، Dart 3.12.x، Material 3، Riverpod، go_router، Freezed، Drift، intl، connectivity_plus، shared_preferences، mocktail.

## Global Constraints

- Android وiOS فقط.
- Flutter 3.44.x وDart 3.12.x.
- البيئة المدققة حاليًا هي Flutter 3.41.2 وDart 3.11.0؛ ترقية SDK إلى الحد المستهدف بوابة صريحة قبل اعتماد Build الإصدار.
- العربية والإنجليزية مع RTL/LTR.
- Pages رفيعة، Widgets قابلة لإعادة الاستخدام، ولا منطق أعمال داخل UI.
- كل النصوص من ARB وكل القيم البصرية من Tokens.
- TDD وCommit مستقل لكل Task.
- المرجع البصري الملزم هو `doc/specs/2026-08-01-ui-design-system.md`، وتقرير الوضع الحالي هو `doc/2026-08-01-project-audit.md`.
- Primary دلالي برتقالي: Light `#C94F22` مع `#FFFFFF`، وDark `#FF9A73` مع `#24120B`؛ البنفسجي للعروض فقط.
- Plus Jakarta للنص اللاتيني وCairo للعربية بأوزان 400/500/700.
- كل تسليم بصري يثبت Light/Dark وRTL/LTR و48×48 و200% text scale.

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

## Current Baseline Gate

التدقيق في 2026-08-01 أثبت وجود المعمارية الأولية، لكنه وجد أربعة أخطاء
Analyze وHome ثابتة انفصلت عن ViewModel. لذلك تنفذ Task 0 قبل متابعة أي Task
Foundation أو ميزة تعتمد عليها. لا تعتبر المهام الموجودة منجزة بمجرد وجود
الملفات؛ الإنجاز يتطلب اجتياز أوامر التحقق المكتوبة في كل Task.

### Task 0: Restore a buildable typed Foundation baseline

**Files:**
- Modify: `lib/core/extensions/extensions.dart`
- Modify: `lib/features/home/presentation/pages/home_page.dart`
- Modify: `lib/features/home/presentation/widgets/categories_widget.dart`
- Modify: Home widgets that currently contain static source data
- Test: `test/core/extensions/extensions_test.dart`
- Test: `test/features/home/home_page_test.dart`

**Interfaces:**
- Consumes: existing `HomeCategory`, `HomeRepository`, `HomeCategoriesViewModel`, and `isOnlineProvider`.
- Produces: one typed Home data flow and a project with zero Analyze errors.

- [ ] **Step 1: Add a regression test for RTL detection**

Render a widget inside RTL and LTR `Directionality` and assert `context.isRtl`
returns true and false respectively. Import intl with an alias or a narrowed
`show` list so Flutter `TextDirection` cannot collide with intl types.

- [ ] **Step 2: Add a Home compilation and state test**

Override `homeRepositoryProvider`, render `HomePage`, and assert Loading,
success, selection, Offline banner, and failure states. This test must import
the complete Home page and all its widgets so type errors cannot remain hidden.

- [ ] **Step 3: Remove the static category map**

`CategoriesWidget` consumes `List<HomeCategory>` plus
`ValueChanged<String> onSelected`. It does not create
`List<Map<String, dynamic>>` and does not own mock data.

- [ ] **Step 4: Restore the Home presentation boundary**

`HomePage` watches `homeCategoriesViewModelProvider` and `isOnlineProvider`,
uses `AppAsyncBuilder`, and composes the approved Header, PromoBanner,
CategoryCard, offer, and product widgets. Repository reads and category
selection remain in the ViewModel.

- [ ] **Step 5: Format and verify the repaired baseline**

```bash
dart format lib test
flutter analyze
flutter test
```

Expected: formatting clean, zero Analyze errors, and all existing plus new
tests pass.

- [ ] **Step 6: Commit**

```bash
git add lib/core/extensions lib/features/home test/core/extensions test/features/home
git commit -m "fix(foundation): restore typed home vertical slice"
```

### Task 1: Initialize the Flutter project and strict analysis

**Files:**
- Create: `pubspec.yaml`
- Create: `analysis_options.yaml`
- Create: `lib/main.dart`
- Create: `test/smoke/app_boot_test.dart`

**Interfaces:**
- Produces: Flutter application package named `rehlaa`.
- Produces: `void main()` entry point.

- [ ] **Step 1: Create the project**

```bash
flutter create --org com.rehlaa --platforms=android,ios --empty rehlaa
cd rehlaa
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
import 'package:rehlaa/app/app.dart';

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
  "appName": "تفعيلك",
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
  static const success = Color(0xFF1F8F5F);
  static const warning = Color(0xFFB76E00);
  static const error = Color(0xFFD92D3A);
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
  static const success = Color(0xFF4CD391);
  static const warning = Color(0xFFFFC857);
  static const error = Color(0xFFFF737D);
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

Add `AppRadius` values 10/12/16/20/30/40/pill, `AppSizes` values for
52-pixel primary buttons, 46-pixel icon actions, 56-pixel category icons, and
48-pixel minimum targets, plus 200ms and 250ms motion tokens. Configure Material
3 component themes and a typed ThemeExtension so feature widgets consume
semantic roles rather than Light/Dark classes directly.

- [ ] **Step 3: Register locale-aware typography**

Add bundled Cairo assets at weights 400/500/700. Plus Jakarta remains the
Latin family. Implement the approved 32/24/20/16/14/12 scale and select the
Arabic family for Arabic locale without changing numeric/technical value
directionality.

- [ ] **Step 4: Implement theme controller**

```dart
@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() => ThemeMode.system;

  void setThemeMode(ThemeMode mode) => state = mode;
}
```

- [ ] **Step 5: Run tests and commit**

```bash
dart run build_runner build --delete-conflicting-outputs
flutter test test/core/design_system/theme/theme_test.dart
git add lib/core/design_system test/core/design_system
git commit -m "feat(ui): add token driven light and dark themes"
```

### Task 7: Build foundational reusable widgets

**Files:**
- Create: `lib/core/design_system/components/buttons/app_primary_button.dart`
- Create: `lib/core/design_system/components/buttons/app_secondary_button.dart`
- Create: `lib/core/design_system/components/buttons/app_outlined_button.dart`
- Create: `lib/core/design_system/components/fields/app_text_field.dart`
- Create: `lib/core/design_system/components/fields/app_password_field.dart`
- Create: `lib/core/design_system/components/fields/app_search_field.dart`
- Create: `lib/core/design_system/components/actions/app_icon_button.dart`
- Create: `lib/core/design_system/components/badges/notification_badge.dart`
- Create: `lib/core/design_system/components/cards/app_card.dart`
- Create: `lib/core/design_system/components/layout/app_scaffold.dart`
- Create: `lib/core/design_system/components/layout/app_section_header.dart`
- Create: `lib/core/design_system/components/overlays/app_bottom_sheet.dart`
- Create: `lib/core/design_system/components/overlays/app_modal_handle.dart`
- Create: `lib/core/design_system/components/navigation/app_bottom_navigation.dart`
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

`AppTextField` uses radius 28, `AppSearchField` uses a muted radius-12 surface,
buttons use height 52 and radius 16, icon actions expose a 48×48 target with a
46×46 visual container, cards use radius 16 and semantic outline, banners use
radius 20, and sheets use radius 30. Every icon-only action requires a localized
tooltip and semantic label.

Do not expose `double` prices from design-system commerce buttons. Consume a
typed `Money` value or already localized display text plus typed callbacks.

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

`HomePage` must only watch `homeViewModelProvider` and connectivity state,
display `AppAsyncValueBuilder`, and compose `HomeHeader`, `PromoBanner`,
`CategorySection`, `AppSectionHeader`, product sections, and
`AppOfflineBanner`. Home widgets receive typed data and callbacks; they do not
create their own mock lists or introduce raw visual values.

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
