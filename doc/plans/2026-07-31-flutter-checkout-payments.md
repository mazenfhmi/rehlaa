# Flutter Checkout and Payments Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** تنفيذ Checkout كامل ببيانات Mock يشمل ملخص الطلب، الكوبون، الإحالة، استخدام المحفظة جزئيًا، Bravo، CashilPay، والتحويل البنكي مع رقم العملية وصورة الإيصال.

**Architecture:** يحتفظ Domain بكل حسابات الأسعار والتخصيصات المالية. يعرض ViewModel CheckoutQuote واحدة مصدر حقيقة، وتعمل واجهة Checkout كـDraggable Bottom Sheet مركبة من Widgets مشتركة.

**Tech Stack:** Riverpod، Freezed، Money value object، image_picker/file_picker، go_router، mocktail.

## Global Constraints

- لا تستخدم double للأموال.
- كل Quote تأتي من Use Case/Repository، لا من Widget.
- العمليات المالية ممنوعة Offline.
- التحويل البنكي لا يعتبر مدفوعًا؛ حالته `pendingReview`.
- عقد الواجهة الملزم: `doc/specs/2026-08-01-ui-design-system.md`.
- Checkout يستخدم AppBottomSheet دلالية radius 30، grouped AppCards، وsticky action آمن مع لوحة المفاتيح.
- كل اختيار يملك selected/focus/error state نصية ودلالية؛ اللون ليس الإشارة الوحيدة.
- اختبارات التدفق المالي تشمل Light/Dark وRTL/LTR وOffline و48×48 و200% text scale.

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
dart run build_runner build
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

Payment and bank tiles use semantic surface/outline/primary roles and expose
their selected state to Semantics. `PriceSummary` consumes typed `Money` only.
Receipt upload has localized empty, selected, invalid-type, oversized, and
error states in both themes.

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

The sheet uses radius-30 top corners, a visible handle, grouped `AppCard`
sections, bounded height, keyboard-safe scrolling, and a sticky action region.
Bank/account/operation values remain LTR inside Arabic while their labels and
section order remain directional.

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
