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
- عقد الواجهة الملزم: `doc/specs/2026-08-01-ui-design-system.md`.
- صفحات المصادقة تستخدم Light/Dark الدلاليين، Plus Jakarta/Cairo، RTL/LTR، وحقولًا تقنية LTR داخل العربية.
- لا تقرأ Pages الـRepository مباشرة؛ Register/Forgot/Verify/Reset لكل منها ViewModel وحالة submit typed.
- اختبارات الواجهة تشمل 360×800، لوحة مفاتيح مفتوحة، 48×48، و200% text scale.

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
- Create: `lib/features/authentication/presentation/widgets/auth_header.dart`
- Create: `lib/features/authentication/presentation/widgets/auth_form_card.dart`
- Create: `lib/features/authentication/presentation/widgets/google_sign_in_button.dart`
- Create: `lib/features/authentication/presentation/widgets/otp_field.dart`
- Create: `lib/features/authentication/presentation/widgets/auth_footer_link.dart`
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

Use `AppTextField`, `AppPasswordField`, `AppPrimaryButton`, and
`GoogleSignInButton`. The composition uses a flat app bar, centered 24/700
heading, concise support copy, radius-28 fields, and a 52-pixel primary action.
Preserve LTR direction inside email, token, and code fields in Arabic mode.
All copy comes from ARB and all focus/error/disabled/loading colors come from
the active theme.

- [ ] **Step 3: Build all pages with no duplicated form logic**

Each page owns only its field controllers and binds to a dedicated ViewModel.

- [ ] **Step 4: Test both locales**

Cover Light English and Dark Arabic, keyboard-open scrolling, disabled/loading
actions, focus/error states, 360×800, and 200% text scaling. Every icon-only
password or navigation action exposes a localized semantic label.

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
