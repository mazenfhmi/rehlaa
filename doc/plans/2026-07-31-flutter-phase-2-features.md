# Flutter Phase 2 Features Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** إضافة الطلبات وتفاصيلها، مركز الإشعارات، البحث والفلاتر، صفحات الدعم والخصوصية والمعلومات باستخدام نفس المعمارية والـWidgets.

**Architecture:** كل ميزة مستقلة بعقد Repository وMock implementation، مع إعادة استخدام ProductCard وAppAsyncValueBuilder وSettingsTile ومكونات النظام الحالية.

**Tech Stack:** Riverpod، Freezed، go_router، Drift read cache، intl، shared design system.

## Global Constraints

- لا تنسخ Widgets من المرحلة الأولى؛ استخرج shared widget عند الاستخدام الفعلي الثاني.
- البحث يعمل Debounce 400ms.
- الطلبات والإشعارات محمية بالمصادقة.
- صفحات السياسات تقرأ محتوى محليًا من Assets في إصدار Mock.

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
