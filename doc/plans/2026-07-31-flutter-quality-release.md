# Flutter Quality and Release Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** تثبيت الجودة البصرية والوظيفية، إمكانية الوصول، الأداء، CI، وبناء إصدارات Android وiOS قابلة للتسليم.

**Architecture:** تستخدم الاختبارات Provider overrides ومصادر Mock ثابتة. تُفصل Golden harness وintegration drivers عن كود الإنتاج، وتُمنع أي شبكة حقيقية أثناء الاختبارات.

**Tech Stack:** flutter_test، integration_test، mocktail، golden tests، GitHub Actions، Flutter release builds.

## Global Constraints

- لا توجد اختبارات متجاهلة.
- لا يتم تحديث Golden files دون مراجعة بصرية.
- جميع التدفقات المالية تختبر Offline وLoading وFailure.
- نجاح `flutter analyze` شرط قبل أي Build.

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
