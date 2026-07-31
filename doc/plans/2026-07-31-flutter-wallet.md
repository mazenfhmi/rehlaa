# Flutter Wallet Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement wallet dashboard, balance hide/show, transactions log, top-up sheet, quick amounts, and navigate to bank transfer payment with Mock data.

**Architecture:** The wallet displays a standalone Ledger-style read model, while the top-up operation creates a WalletTopUp Checkout and does not modify the balance before accepting the Mock payment. All financial operations are disabled when Offline.

**Tech Stack:** Riverpod, Freezed, shared Money, checkout shared widgets, go_router, mocktail.

## Global Constraints

- Minimum top-up: 5,000 SDG.
- Quick amounts: 5K, 10K, 20K, 50K, 100K, 200K.
- Do not allow using the wallet to pay for wallet top-up.
- Transactions log is not modified by the UI.

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
