# Flutter Mobile Application Master Implementation Roadmap

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

> **Execution authority:** Use `doc/plans/2026-08-01-rehlaa-master-execution-plan.md` for the current ordered checklist, completion state, decision gates, and phase gates. This file remains the product-level roadmap; any historical environment status below is superseded by the newer execution log.

**Goal:** بناء تطبيق متجر خدمات رقمية للهواتف باستخدام Flutter على Android وiOS، مع واجهات عربية وإنجليزية، بيانات Mock قابلة للاستبدال لاحقًا بالـAPI، ونظام Widgets موحد يغطي جميع الصفحات.

**Architecture:** يعتمد المشروع Feature-first Clean MVVM مع Riverpod لإدارة الحالة والاعتماديات، Repository Contracts لعزل مصادر البيانات، وطبقة Domain انتقائية للمنطق المشترك والمعقد. تبدأ جميع الميزات بمصادر Mock وذاكرة محلية للقراءة فقط، بينما تُمنع عمليات الشراء والدفع والمحفظة دون اتصال.

**Tech Stack:** Flutter 3.44.x، Dart 3.12.x، Material 3، flutter_riverpod 3.3.1، riverpod_annotation 4.0.2، riverpod_generator 4.0.3، go_router 17.3.0، Freezed 3.2.5، json_serializable 6.12.0، Drift 2.30.1، intl، connectivity_plus، shared_preferences، flutter_secure_storage، cached_network_image، flutter_svg، image_picker/file_picker، mocktail، flutter_test، integration_test.

## Global Constraints

- المنصات المستهدفة في الإصدار الأول: Android وiOS فقط.
- الحد الأدنى لبيئة التطوير: Flutter 3.44.x وDart 3.12.x.
- البيئة المدققة حاليًا Flutter 3.41.2 وDart 3.11.0؛ لا يبدأ Build الإصدار قبل ترقية SDK أو اعتماد خط أساس بديل صريح.
- اللغات: العربية والإنجليزية من أول إصدار مع RTL/LTR كامل.
- إدارة الحالة والاعتماديات: Riverpod باستخدام Notifier وAsyncNotifier ومولد الأكواد.
- المعمارية: Feature-first Clean MVVM مع Domain انتقائي وRepository Contracts.
- مصدر البيانات الحالي: Mock repositories فقط؛ لا تنشئ API implementations فارغة.
- التخزين المحلي: بيانات قراءة غير حساسة وإعدادات فقط؛ لا تُنفذ عمليات مالية دون اتصال.
- المصادقة: بريد/كلمة مرور وGoogle، مع تصفح كضيف، دون Apple Sign-In.
- كل النصوص المرئية تأتي من ARB؛ يمنع hard-coded user-facing strings.
- كل المسافات والألوان والحواف والخطوط والحركات تأتي من Design Tokens.
- الصفحات Thin Pages؛ الهدف أقل من 150 سطرًا للصفحة، مع تفكيكها إلى Widgets.
- يمنع الوصول إلى Repository أو Storage أو DataSource من Widget مباشرة.
- يمنع استخدام `double` للأموال؛ استخدم أصغر وحدة صحيحة عبر `Money.minorUnits`.
- لا يستخدم `Map<String, dynamic>` خارج حدود DTO والمصادر الوهمية.
- جميع المهام تنفذ بأسلوب TDD، وتنتهي باختبارات ناجحة وCommit مستقل.
- لا تُقبل أي مرحلة مع `flutter analyze` errors أو اختبارات متجاهلة.
- المرجع البصري الملزم: `doc/specs/2026-08-01-ui-design-system.md`، ومصدر الاستخراج الثابت: `doc/ui.txt`.
- تقرير التنفيذ الحالي والأولويات: `doc/2026-08-01-project-audit.md`.
- Primary دلالي برتقالي في الوضعين؛ البنفسجي Promotional فقط.
- Plus Jakarta للاتينية وCairo للعربية بأوزان 400/500/700.
- كل تسليم بصري يثبت Light/Dark وRTL/LTR وWCAG و48×48 و200% text scale.

---

## 1. تقسيم التنفيذ إلى خطط مستقلة

ينفذ المشروع بالترتيب التالي، ولا تبدأ خطة تعتمد على أخرى قبل اجتياز بوابة الجودة الخاصة بالخطة السابقة:

| الترتيب | الخطة | الناتج القابل للاختبار |
|---:|---|---|
| 1 | `2026-07-31-flutter-foundation.md` | مشروع يعمل، Theme/L10n/Router/Design System/Offline foundation وVertical Slice واحدة |
| 2 | `2026-07-31-flutter-authentication.md` | تدفقات المصادقة الوهمية كاملة، الضيف، والحماية وإعادة التوجيه |
| 3 | `2026-07-31-flutter-catalog-commerce.md` | Home، المنتجات، التفاصيل، الخيارات، المفضلة، والسلة |
| 4 | `2026-07-31-flutter-checkout-payments.md` | Checkout، الكوبون، الإحالة، المحفظة الجزئية، وطرق الدفع والتحويل البنكي |
| 5 | `2026-07-31-flutter-wallet.md` | المحفظة، الرصيد، الحركات، الشحن، وإرسال إيصال التحويل |
| 6 | `2026-07-31-flutter-profile-settings.md` | الملف الشخصي، تعديل الحساب، اللغة، الثيم، الإشعارات، والخروج |
| 7 | `2026-07-31-flutter-phase-2-features.md` | الطلبات، الإشعارات، البحث والفلاتر، الدعم والسياسات |
| 8 | `2026-07-31-flutter-quality-release.md` | Golden/Integration/Accessibility/Performance/CI وتجهيز نسخ Android وiOS |
| 9 | `2026-08-01-ui-plan-alignment.md` | تدقيق اتساق جميع وثائق الخطة مع عقد الواجهة والحالة الفعلية للمشروع |

### Current implementation gate

لا تبدأ خطة Catalog أو أي عملية مالية قبل اجتياز Foundation Task 0 المضافة
بعد التدقيق: إصلاح أخطاء Analyze، إعادة Home إلى Repository/ViewModel، تفعيل
AppLocalizations، واعتماد Semantic Light/Dark. وجود الملفات دون اجتياز
الاختبارات لا يُحسب إنجازًا.

## 2. خريطة الاعتماديات بين الميزات

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

## 3. ترتيب بناء الواجهات

### المرحلة الأولى: البنية والهوية

1. إصلاح خط الأساس الحالي وإعادة Home إلى data flow typed.
2. ترقية/تثبيت Toolchain ثم Bootstrap وبيئات التشغيل.
3. Semantic color roles للوضعين.
4. Plus Jakarta/Cairo وTypography scale.
5. Spacing/Shape/Size/Motion tokens.
6. Widgets العامة وحالاتها التفاعلية.
7. الترجمة واتجاه النص والقيم التقنية LTR.
8. Router Shell والحماية وشريط التنقل.
9. حالات Loading/Empty/Error/Offline.
10. Home proof slice بالبيانات وOffline والاختبارات.

### المرحلة الثانية: المصادقة والكتالوج

1. Login.
2. Register.
3. Email verification.
4. Forgot/reset password.
5. Home.
6. Product details.
7. Favorites.
8. Empty/populated cart.

### المرحلة الثالثة: العمليات المالية

1. Checkout summary.
2. Coupon/referral.
3. Wallet allocation.
4. Payment method selection.
5. Bank selection/details.
6. Operation number and receipt upload.
7. Wallet dashboard.
8. Wallet top-up sheet.

### المرحلة الرابعة: الحساب والتوسع

1. Profile.
2. Account edit.
3. Language/theme/notifications settings.
4. Orders and order details.
5. Notifications center.
6. Search/filter.
7. Support and policy pages.

## 4. قاعدة إعادة استخدام Widgets

```text
Page
└── Feature Widgets
    ├── Shared Business Widgets
    └── Design System Widgets
```

- يوضع Widget في `core/design_system/components` عندما يكون بصريًا عامًا بلا منطق تجاري.
- يوضع في `shared/presentation/widgets` عندما تستخدمه ميزتان فعليًا.
- يبقى داخل `features/<feature>/presentation/widgets` إذا كان خاصًا بميزة واحدة.
- لا تنشئ Widgets افتراضية مسبقًا لمجرد احتمال استخدامها مستقبلًا.
- كل Widget يتلقى بياناته عبر constructor ولا يقرأ Provider إلا عند حدود الصفحة أو Widget تنسيقي واضح.

## 5. بوابات الجودة

### بوابة كل Task

```bash
flutter analyze
flutter test <targeted_test_path>
```

### بوابة كل خطة

```bash
flutter analyze
flutter test
flutter test integration_test
```

### بوابة الإصدار

```bash
flutter build appbundle --release
flutter build ipa --release --no-codesign
```

ويجب التأكد من:

- عدم وجود Overflow على 360×800 و390×844 و412×915.
- نجاح RTL وLTR.
- نجاح Light وDark.
- جميع الأزرار المهمة لها حالات Loading/Disabled/Error.
- جميع الصور لها Loading fallback وError state.
- الأهداف اللمسية لا تقل عن 48×48 logical pixels.
- النصوص العادية تحقق 4.5:1 والعناصر غير النصية تحقق 3:1.
- لا يحدث Overflow أو فقد إجراء عند 200% text scale.
- لا تستخدم Feature widgets قيم Color/Spacing/Radius/Typography/Motion خام.
- العمليات المالية غير متاحة في Offline mode.

## 6. استراتيجية الفروع والـCommits

- فرع مستقل لكل خطة: `feature/foundation`, `feature/auth`, `feature/catalog`, وهكذا.
- Commit واحد على الأقل لكل Task.
- رسائل Commit بصيغة Conventional Commits:

```text
feat(wallet): add balance dashboard
fix(checkout): preserve ltr account number in arabic
refactor(ui): extract shared payment method tile
test(auth): cover guest redirect flow
```

## 7. تعريف الإنجاز النهائي

يعد تطبيق الهاتف مكتملًا عندما:

- تعمل جميع شاشات المرحلتين الأولى والثانية من الخطة ببيانات Mock متسقة.
- تعمل العربية والإنجليزية والثيمان أثناء التشغيل دون إعادة تشغيل التطبيق.
- يدعم التصفح كضيف ويطلب المصادقة عند الإجراءات المحمية ثم يعيد المستخدم لوجهته.
- تعرض بيانات الكتالوج المخزنة عند فقد الشبكة وتمنع الدفع والمحفظة.
- تتطابق الشاشات الرئيسية بصريًا مع الصور المرجعية ضمن حدود الأصول المتاحة.
- تتبع جميع الشاشات `2026-08-01-ui-design-system.md` دون لوحة ميزة مستقلة أو Primary بنفسجي.
- يعمل النص حتى 200% وتحقق الأهداف 48×48 والتباين WCAG المحدد في الخطة.
- تمر Unit وWidget وGolden وIntegration tests.
- ينجح بناء Android App Bundle وiOS IPA دون أخطاء تحليل أو اختبارات متجاهلة.
- يمكن استبدال Mock Repository عبر Provider override دون تعديل Pages أو ViewModels العامة.
