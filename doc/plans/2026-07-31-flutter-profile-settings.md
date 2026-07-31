# Flutter Profile and Settings Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** تنفيذ صفحة الملف الشخصي، الإحصاءات، تعديل بيانات الحساب، تغيير كلمة المرور، اللغة، الثيم، إعدادات الإشعارات، وروتين تسجيل الخروج.

**Architecture:** تفصل Profile data عن App settings. تستخدم LocaleController وThemeController الموجودين في Foundation، بينما يعرض ProfileRepository بيانات المستخدم والإحصاءات الوهمية.

**Tech Stack:** Riverpod، Freezed، shared_preferences، auth session controller، go_router، image picker contract.

## Global Constraints

- لا تكرر قسم تغيير كلمة المرور.
- البريد والأسماء تخضع للتحقق.
- تغيير كلمة المرور اختياري؛ إذا أُدخلت كلمة جديدة تصبح الحالية والتأكيد مطلوبين.
- اللغة والثيم يطبقان أثناء التشغيل.

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
