# Rehlaa Master Execution Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use `superpowers:executing-plans` to execute this plan in order. Every task is implemented through its linked detailed plan, using TDD, a focused verification cycle, and an independent commit.

**Goal:** تنفيذ جميع الخطط والمهام الموجودة داخل `doc/` بترتيب واحد واضح، مع الحفاظ على فكرة تطبيق Rehlaa، المعمارية المعتمدة، ونظام التصميم الموحد في الوضعين الفاتح والداكن.

**Architecture:** هذا الملف هو المرجع الحاكم لترتيب التنفيذ وحالة المهام وبوابات الانتقال بين المراحل. تبقى الخطط التخصصية هي المرجع الحاكم للملفات والواجهات وخطوات TDD التفصيلية، بينما تبقى مواصفات المعمارية والتصميم هي المرجع الحاكم للقرارات؛ لا تُنسخ تفاصيلها هنا منعًا للتعارض.

**Tech Stack:** Flutter 3.44.x، Dart 3.12.x، Material 3، Riverpod، go_router، Freezed، Drift، intl، ARB localization، shared_preferences، flutter_secure_storage، mocktail، flutter_test، integration_test.

## 1. سلطة الوثائق

عند وجود اختلاف بين الوثائق، تُطبّق الأولوية التالية:

1. `doc/specs/2026-08-01-ui-design-system.md` للهوية البصرية، الألوان، الخطوط، المكونات، Light/Dark، RTL/LTR، وإمكانية الوصول.
2. `doc/specs/2026-07-31-flutter-mobile-app-design.md` و`doc/Architecture.md` للمعمارية وحدود الطبقات.
3. خطة الميزة التخصصية داخل `doc/plans/` للملفات، الواجهات، الاختبارات، وخطوات التنفيذ.
4. هذا الملف لترتيب التنفيذ، التبعيات، الحالة، وبوابات الجودة.
5. `doc/plans/2026-07-31-flutter-mobile-app-complete-implementation-plan.md` نسخة تجميعية للقراءة فقط؛ الخطة التخصصية تفوز عند اختلاف التفاصيل.
6. `doc/ui.txt` مرجع بصري ثابت للاستخراج فقط، ولا يُنسخ منه منطق أو معمارية أو بيانات غير typed.

### 1.1 بيان تغطية ملفات `doc/`

تشمل هذه الخطة جميع المصادر الموجودة وقت إنشائها:

- الحالة والمعمارية: `doc/2026-08-01-project-audit.md` و`doc/Architecture.md`.
- المصدر البصري الثابت: `doc/ui.txt`.
- المواصفات: `doc/specs/2026-07-31-flutter-mobile-app-design.md` و`doc/specs/2026-08-01-ui-design-system.md`.
- الخرائط التجميعية: `doc/plans/2026-07-31-flutter-mobile-app-master-roadmap.md` و`doc/plans/2026-07-31-flutter-mobile-app-complete-implementation-plan.md`.
- الخطط التنفيذية: Foundation وAuthentication وCatalog/Commerce وCheckout/Payments وWallet وProfile/Settings وPhase 2 وQuality/Release.
- خطة اتساق الوثائق: `doc/plans/2026-08-01-ui-plan-alignment.md`.

تقرير التدقيق يوثق نقطة الأساس التاريخية التي سبقت إصلاحات `F00` وترقية `F01`؛ عند اختلاف أرقام حالته مع سجل التنفيذ في هذا الملف، يكون سجل التنفيذ الأحدث هو المرجع.

## 2. القيود العامة

- المنصتان المستهدفتان: Android وiOS.
- اللغتان: العربية والإنجليزية مع RTL/LTR كامل من أول إصدار.
- Primary دلالي برتقالي: Light `#C94F22` وDark `#FF9A73`؛ البنفسجي Promotional فقط.
- Plus Jakarta للنص اللاتيني وCairo بأوزان 400/500/700 للنص العربي.
- كل القيم البصرية تأتي من Design Tokens ومكونات typed، ولا توضع قيم خام داخل الميزات.
- Feature-first Clean MVVM مع Riverpod وRepository Contracts وDomain انتقائي.
- الصفحات Thin Pages، ولا تصل Widgets مباشرة إلى Repository أو Storage أو DataSource.
- لا يستخدم `double` للأموال؛ تستخدم `Money.minorUnits` بأصغر وحدة صحيحة.
- لا يستخدم `Map<String, dynamic>` خارج DTO وحدود مصادر البيانات الوهمية.
- مصدر البيانات الحالي Mock وقابل للاستبدال؛ لا تنشأ API implementations فارغة.
- العمليات الشرائية والمالية وعمليات المحفظة محظورة دون اتصال.
- جميع النصوص المرئية تأتي من ARB، بما فيها حالات الخطأ والفراغ وعدم الاتصال.
- كل مهمة تبدأ باختبار يفشل، ثم أقل تنفيذ ناجح، ثم اختبار مركز، ثم تحليل، ثم commit مستقل.
- لا تنتقل مرحلة إلى التالية مع Analyzer errors أو اختبارات فاشلة أو ملفات مولدة غير متزامنة.
- كل واجهة جديدة تثبت Light/Dark وArabic/English وRTL/LTR و200% text scale وأهداف لمس 48×48.
- لا تستخدم `dependency_overrides` لإجبار Analyzer أو مولدات الأكواد على إصدارات غير متوافقة.

## 3. ترميز الحالة

- `[x]` منجز ومتحقق منه.
- `[ ]` لم يكتمل بعد، حتى لو وُجد تنفيذ جزئي في المستودع.
- `محجوب` يعني أن بدء المهمة يتطلب حسم بوابة قرار موثقة أدناه.

## 4. الحالة الحالية ونقطة الاستئناف

| البند | الحالة | الدليل أو الإجراء التالي |
|---|---|---|
| مواءمة جميع خطط الواجهة | منجزة | الخطط والمواصفات تشير إلى عقد التصميم الموحد |
| Foundation Task 0 | منجزة | Home typed وعادت إلى Repository/ViewModel مع اختبارات الحالات |
| Foundation Task 1 | منجزة | Flutter 3.44.8 وDart 3.12.2، واختبارات المشروع 28/28 |
| Foundation Task 2 | منجزة | مصفوفة DG-01 مثبتة، والتوليد والتحليل والاختبارات ناجحة |
| بقية Foundation | منجزة | F03–F10 منفذة ومثبتة بالاختبارات |
| Authentication | منجزة | A01–A07 منفذة، وحماية المسارات و`returnTo` مثبتان بالاختبارات |
| Catalog | قيد الاستكمال | C01–C07 مثبتة؛ نقطة الاستئناف C08 ثم بوابة قبول المرحلة |
| Checkout | قيد الاستكمال | P01–P06 لها تنفيذ عامل؛ P07–P08 وتغطية الملف/Offline/RTL/الثيمات لم تكتمل |
| نقطة الاستئناف | C08 ثم بوابة المرحلة 3 | إغلاق السلة والتدفق التكاملي قبل استكمال Checkout |

### DG-01: بوابة توافق الاعتماديات

اعتمدت المهمة `F02` المصفوفة التالية بعد إثبات تقاطع مولداتها على Analyzer 9 دون `dependency_overrides`:

```yaml
flutter_riverpod: 3.3.1
riverpod_annotation: 4.0.2
riverpod_generator: 4.0.3
go_router: 17.3.0
freezed_annotation: 3.1.0
freezed: 3.2.5
json_annotation: 4.10.0
json_serializable: 6.12.0
drift: 2.30.1
drift_dev: 2.30.1
drift_flutter: 0.2.8
build_runner: ^2.10.4
```

نجح `flutter pub get` و`dart run build_runner build` وجميع الاختبارات بهذه المصفوفة. القيد المعروف: Analyzer 9 يحلل مستوى لغة Dart 3.11 داخل المولدات، لذلك لا تستخدم صياغة خاصة بـDart 3.12 داخل الملفات المعلّمة للتوليد حتى تتوفر سلسلة مستقرة تجمع Riverpod وFreezed وDrift على Analyzer أحدث.

---

## المرحلة 0: تثبيت مواصفات المشروع ومواءمة الخطط

**المصدر التفصيلي:** `doc/plans/2026-08-01-ui-plan-alignment.md`

**الهدف:** جعل نظام التصميم المعتمد قيدًا مشتركًا في جميع الوثائق قبل تنفيذ الواجهات.

- [x] **D01 — ربط وثائق المعمارية بالمرجع البصري:** تحديث `Architecture.md` ومواصفة المعمارية بعقد UI واحد.
- [x] **D02 — مواءمة خطة Foundation:** تثبيت الألوان الدلالية والخطوط والمكونات وحالاتها.
- [x] **D03 — مواءمة المصادقة:** تحديد مكونات النماذج وحالاتها واختبارات الاتجاه والثيم.
- [x] **D04 — مواءمة Home والمتجر والسلة:** تحديد ProductCard وCategoryCard وPromoBanner وتركيب التفاصيل والسلة.
- [x] **D05 — مواءمة Checkout والمحفظة:** توحيد الأسطح المالية والحالات الدلالية وإمكانية الوصول.
- [x] **D06 — مواءمة Profile وPhase 2:** إعادة استخدام مكونات الإعدادات والبحث والحالة والمحتوى.
- [x] **D07 — تقوية بوابات الجودة البصرية:** إضافة Golden وWCAG و200% text scale والمقاسات المرجعية.
- [x] **D08 — تحديث خارطة الطريق:** جعل UI system تبعية عامة لكل مرحلة.
- [x] **D09 — مزامنة الخطة التجميعية:** إضافة manifest وإزالة قواعد التصميم القديمة.
- [x] **D10 — تدقيق مجموعة `doc/`:** التأكد من التغطية وعدم تغيير `ui.txt` أو فكرة التطبيق.

### بوابة المرحلة 0

- [x] كل خطة تخصصية تشير إلى `doc/specs/2026-08-01-ui-design-system.md`.
- [x] البنفسجي ليس لون الإجراءات الأساسي، والألوان الفاتحة والداكنة محددة دلاليًا.
- [x] المتطلبات الوظيفية والمعمارية الأصلية محفوظة.

---

## المرحلة 1: Foundation مستقرة وقابلة للبناء

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-foundation.md`

**التبعية:** المرحلة 0.

**الناتج:** تطبيق يعمل باللغتين والثيمين، مع Router وDesign System وتخزين واتصال وHome vertical slice مثبتة.

- [x] **F00 — استعادة baseline typed وقابل للبناء:** إصلاح RTL وCategories وإعادة Home إلى ViewModel واختبار الحالات.
- [x] **F01 — تهيئة Flutter والتحليل الصارم:** اعتماد Flutter 3.44.x/Dart 3.12.x وتثبيت smoke test.
- [x] **F02 — إضافة الاعتماديات ومولدات الأكواد:** اجتياز `DG-01`، ضبط `pubspec.yaml` و`build.yaml`، وتشغيل التوليد.
- [x] **F03 — تثبيت Result وFailure typed:** إكمال التسلسل الهرمي ورسائل العرض واختبارات النجاح والفشل.
- [x] **F04 — تثبيت Bootstrap وتشخيص Riverpod:** البيئات، `runZonedGuarded`، observer، وربط `main.dart`.
- [x] **F05 — تفعيل الترجمة وتغيير اللغة وقت التشغيل:** توصيل delegates وARB وإزالة النصوص المرئية الثابتة.
- [x] **F06 — تطبيق Light/Dark الدلالي والخطوط:** Theme extensions، Material 3، Plus Jakarta/Cairo، واستعادة ThemeMode.
- [x] **F07 — إكمال المكونات الأساسية القابلة لإعادة الاستخدام:** الأزرار والحقول والبطاقات والـnavigation والـfeedback بكل الحالات.
- [x] **F08 — إكمال الاتصال والتفضيلات المحلية:** initial connectivity، contracts، persistence، واختبارات الاستعادة.
- [x] **F09 — تثبيت Shell Router والفروع المؤقتة:** `StatefulShellRoute.indexedStack` وتسميات ARB وسلوك الرجوع.
- [x] **F10 — إثبات المعمارية عبر Home vertical slice:** Repository → ViewModel → Page مع loading/error/offline/success.

### بوابة Foundation

- [x] `dart format --output=none --set-exit-if-changed lib test` ينجح.
- [x] `flutter analyze` ينجح دون errors أو warnings.
- [x] `flutter test` ينجح بالكامل.
- [x] `dart run build_runner build` ينجح ولا يترك diff غير مقصود.
- [x] Home يعمل في Light/Dark وArabic/English وOnline/Offline وحالات Async الأربع.
- [x] لا توجد نصوص مرئية ثابتة أو `double` للأموال أو Map ديناميكية في Widgets.

---

## المرحلة 2: المصادقة وحماية المسارات

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-authentication.md`

**التبعية:** اجتياز بوابة Foundation.

**الناتج:** تسجيل الدخول والتسجيل والتحقق والاستعادة والضيف والحماية وإعادة التوجيه ببيانات Mock.

- [x] **A01 — تعريف Auth entities وRepository contract:** `AuthUser` و`AuthSession` والعقد المستقل عن المزود.
- [x] **A02 — تنفيذ Email/Password value objects:** قواعد تحقق typed ورسائل failures قابلة للترجمة.
- [x] **A03 — تنفيذ Mock Auth Repository حتمي:** سيناريوهات النجاح والفشل والتأخير والجلسة.
- [x] **A04 — تنفيذ Session وForm ViewModels:** منع وصول الصفحات إلى Repository وإدارة submit state مركزيًا.
- [x] **A05 — بناء مكونات وصفحات المصادقة:** Login/Register/Verify/Forgot/Reset وGoogle والضيف دون منطق مكرر.
- [x] **A06 — حماية المسارات و`returnTo`:** توجيه الضيف ثم إعادته إلى الوجهة المطلوبة بعد النجاح.
- [x] **A07 — اختبار تدفقات المصادقة تكامليًا:** المسارات المحمية، الضيف، الخطأ، النجاح، واللغتان.

### بوابة المصادقة

- [x] كل صفحات المصادقة تمر باختبارات Light-English وDark-Arabic و200% text scale.
- [x] لا تصل أي صفحة Auth مباشرة إلى Repository.
- [x] Verify وReset قابلتان للوصول، ونجاح Forgot Password يغير الحالة المرئية.
- [x] protected redirect و`returnTo` مثبتان باختبارات Router وIntegration.
- [x] التحليل وجميع الاختبارات ناجحة.

---

## المرحلة 3: Home والكتالوج والتفاصيل والمفضلة والسلة

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-catalog-commerce.md`

**التبعية:** Foundation والمصادقة؛ ويمكن عرض الكتالوج للضيف مع حماية المفضلة والسلة حسب السياسة.

**الناتج:** مسار متجر كامل حتى سلة جاهزة للـCheckout.

- [x] **C01 — تعريف Catalog entities وMoney:** منتجات وخيارات وأسعار دون `double`.
- [x] **C02 — تنفيذ Mock Catalog وRead Cache:** بيانات حتمية وسياسة cache/offline واضحة.
- [x] **C03 — بناء Product widgets المشتركة:** typed variants للبطاقات والحالات والاتجاهين.
- [x] **C04 — إكمال تركيب Home:** sections رفيعة مرتبطة بـViewModel ومكونات التصميم.
- [x] **C05 — تنفيذ اختيار الخيارات والتسعير:** signature حتمية وحساب السعر في Domain.
- [x] **C06 — بناء Product Details:** gallery/options/quantity/sticky purchase action وحالات التعطيل.
- [x] **C07 — تنفيذ Favorites:** uniqueness وoptimistic update مع rollback وحالة فارغة.
- [ ] **C08 — تنفيذ Cart domain والشاشات:** دمج العناصر بالهوية الصحيحة وملخص typed وحالتي الفراغ والامتلاء.

### بوابة الكتالوج والتجارة

- [ ] تدفق Home → Details → Options → Favorites/Cart يعمل للغتين والثيمين.
- [ ] كل الحسابات تستخدم `Money`، وهوية عنصر السلة تشمل الخيارات المختارة.
- [ ] القراءة من cache تعمل Offline، بينما الإجراءات المحمية تتبع سياسة الجلسة.
- [ ] اختبارات Domain وRepository وViewModel وWidget وIntegration ناجحة.

---

## المرحلة 4: Checkout والمدفوعات

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-checkout-payments.md`

**التبعية:** السلة، المصادقة، Money، الاتصال، ومكونات Design System.

**الناتج:** Checkout Mock كامل للكوبون والإحالة والمحفظة الجزئية وBravo وCashilPay والتحويل البنكي.

- [ ] **P01 — تعريف Checkout entities وQuote contract:** invariants ومصدر حقيقة مالي واحد.
- [ ] **P02 — تنفيذ قواعد الكوبون والإحالة والمحفظة:** ترتيب القواعد والحساب الدقيق.
- [ ] **P03 — تنفيذ طرق الدفع والبيانات البنكية Mock:** اختيار typed وبيانات حتمية.
- [ ] **P04 — تنفيذ Checkout ViewModel:** state immutable وحظر العمليات Offline.
- [ ] **P05 — بناء payment widgets المشتركة:** selection/status/upload states بكل الثيمات.
- [ ] **P06 — بناء Checkout Bottom Sheet:** أقسام مركبة، sticky action، وkeyboard safety.
- [ ] **P07 — تنفيذ اختيار الإيصال والإرسال:** تحقق metadata ورقم العملية ونتيجة Mock.
- [ ] **P08 — اختبار Checkout تكامليًا:** coupon/referral/wallet/payment/receipt/success/offline.

### بوابة Checkout

- [ ] invariants المالية واختبارات التقريب والتخصيص ناجحة.
- [ ] لا يمكن الإرسال Offline ولا يمكن إرسال ملف غير صالح.
- [ ] معنى الحالات المالية لا يعتمد على اللون وحده.
- [ ] التدفق الكامل يعمل دون شبكة حقيقية وفي Light/Dark وRTL/LTR.

---

## المرحلة 5: المحفظة والشحن

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-wallet.md`

**التبعية:** Checkout والمدفوعات وMoney والاتصال والمصادقة.

**الناتج:** رصيد وحركات وإخفاء الرصيد وشحن مرتبط بالـCheckout وحالة مراجعة.

- [ ] **W01 — تعريف Wallet entities والعقود:** ledger وtop-up invariants وRepository contract.
- [ ] **W02 — تنفيذ Mock Wallet Repository:** fixtures وpagination حتمية.
- [ ] **W03 — تنفيذ Wallet ViewModel:** التحميل والتحديث والصفحات وحفظ إظهار الرصيد.
- [ ] **W04 — بناء Wallet dashboard:** balance card والحركات والحالات في الثيمين والاتجاهين.
- [ ] **W05 — تنفيذ Top-up ViewModel:** quick amounts والتحقق وحظر Offline.
- [ ] **W06 — بناء Top-up Bottom Sheet:** إدخال واختيار المبلغ وحالات الخطأ والتحميل.
- [ ] **W07 — ربط الشحن بالـCheckout والمراجعة:** purpose-specific flow دون تعديل الرصيد قبل القبول.

### بوابة المحفظة

- [ ] إخفاء الرصيد محفوظ ودلالاته مناسبة لقارئ الشاشة.
- [ ] pagination والتحديث والشحن والحالات المعلقة مثبتة بالاختبارات.
- [ ] لا يتغير الرصيد قبل قبول عملية Mock ولا تنفذ عملية مالية Offline.

---

## المرحلة 6: الملف الشخصي والإعدادات

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-profile-settings.md`

**التبعية:** المصادقة، LocaleController، ThemeController، والتفضيلات.

**الناتج:** ملف وإحصاءات وتعديل حساب وكلمة مرور ولغة وثيم وإشعارات وخروج.

- [ ] **S01 — تعريف Profile/Settings domain:** entities وعقود منفصلة للبيانات والإعدادات.
- [ ] **S02 — تنفيذ Mock Profile Repository:** fixtures والتحقق من كلمة المرور.
- [ ] **S03 — تنفيذ Profile ViewModel والصفحة:** thin composition وإحصاءات وحالات Async.
- [ ] **S04 — تنفيذ منطق تعديل الحساب:** كلمة مرور اختيارية وتطابق وتحقق typed.
- [ ] **S05 — بناء Account Details:** keyboard-safe form وsticky save بلا تكرار.
- [ ] **S06 — حفظ وتطبيق اللغة والثيم:** استعادة عند cold start وصفحات اختيار radio.
- [ ] **S07 — إعدادات الإشعارات والخروج:** حفظ toggles وconfirmation sheet وإنهاء الجلسة.

### بوابة الملف والإعدادات

- [ ] اللغة والثيم وإعدادات الإشعارات تبقى بعد إعادة التشغيل.
- [ ] الخروج يمسح الجلسة الحساسة ويطبق حماية Router.
- [ ] نماذج الحساب تعمل مع لوحة المفاتيح و200% text scale واللغتين.

---

## المرحلة 7: ميزات المرحلة الثانية

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-phase-2-features.md`

**التبعية:** الكتالوج، المصادقة، الملف، والمكونات المشتركة.

**الناتج:** الطلبات والإشعارات والبحث والفلاتر والدعم والسياسات.

- [ ] **X01 — تنفيذ قائمة الطلبات والتفاصيل:** status mapping وRepository/ViewModel وواجهات typed.
- [ ] **X02 — تنفيذ مركز الإشعارات:** unread count وoptimistic read مع rollback وتجميع بالتاريخ.
- [ ] **X03 — تنفيذ البحث المؤجل:** debounce حقيقي وحالات recent/empty/results.
- [ ] **X04 — تنفيذ الفلاتر المتقدمة:** immutable filters وclear/apply ومكونات مشتركة.
- [ ] **X05 — تنفيذ الدعم والسياسات:** محتوى محلي غير فارغ حسب اللغة ونموذج تواصل Mock.
- [ ] **X06 — اختبار المرحلة الثانية تكامليًا:** مفاتيح مستقرة وتدفق موحد للميزات السابقة.

### بوابة المرحلة الثانية

- [ ] الطلبات والإشعارات والبحث والفلاتر والدعم تعمل في اللغتين والثيمين.
- [ ] optimistic updates تتراجع عند الفشل، والبحث يثبت debounce زمنيًا.
- [ ] محتوى السياسات محلي وقابل للقراءة ولا يعتمد على شبكة.

---

## المرحلة 8: الجودة والإصدار

**المصدر التفصيلي:** `doc/plans/2026-07-31-flutter-quality-release.md`

**التبعية:** اكتمال جميع الميزات السابقة.

**الناتج:** أدلة جودة آلية وبصرية، CI، أداء مقاس، ونسخ Android/iOS قابلة للتسليم.

- [ ] **Q01 — بناء Test Harness مشترك:** Provider overrides وlocale/theme/device/text scale حتمية.
- [ ] **Q02 — إضافة Golden coverage:** الشاشات الأساسية والحالات في التركيبات البصرية ذات المعنى.
- [ ] **Q03 — إضافة اختبارات Accessibility:** semantics وcontrast و48×48 و200% text scale.
- [ ] **Q04 — إضافة Integration matrix كاملة:** cold start وتدفقات Android وiOS الأساسية.
- [ ] **Q05 — إضافة CI:** format/analyze/test/codegen consistency/build gates مع Flutter pin.
- [ ] **Q06 — مراجعة الأداء وحدود rebuild:** قياس أولًا ثم إصلاح الحدود المثبتة وتوثيق النتائج.
- [ ] **Q07 — إعداد بيانات إصدار Android وiOS:** identifiers/permissions/usage descriptions/signing handoff.
- [ ] **Q08 — بوابة التحقق النهائي:** clean/get/generate/format/analyze/test/integration/build للمنصتين.

### بوابة الإصدار النهائية

- [ ] تثبيت Android `cmdline-tools` وقبول SDK licenses قبل build النهائي.
- [ ] لا توجد أخطاء أو تحذيرات Analyzer، ولا اختبارات skipped أو flaky.
- [ ] Goldens راجعها إنسان بعد توليدها ثم نجحت دون `--update-goldens`.
- [ ] WCAG AA وRTL/LTR وLight/Dark و200% text scale مثبتة للشاشات الحرجة.
- [ ] `flutter build apk --release` وBuild iOS المناسب لبيئة macOS ينجحان.
- [ ] CI أخضر، ملفات التوليد متزامنة، ومساحة العمل نظيفة.
- [ ] README وتعليمات التشغيل والإصدار تعكس الأوامر والإصدارات الفعلية.

---

## 5. خريطة الاعتماديات المختصرة

```text
UI/Architecture Alignment (D)
└── Foundation (F)
    ├── Authentication (A)
    │   ├── protected Favorites/Cart
    │   ├── Checkout (P)
    │   ├── Wallet (W)
    │   └── Profile/Settings (S)
    └── Catalog/Home (C)
        ├── Cart
        ├── Checkout (P)
        └── Search/Filters/Orders (X)

Checkout (P) ──> Wallet Top-up (W)
Profile + Catalog + Auth ──> Phase 2 (X)
All phases ──> Quality/Release (Q)
```

## 6. بروتوكول تنفيذ كل مهمة

لكل معرّف مهمة بالترتيب:

1. افتح الخطة التخصصية المرتبطة واقرأ قسم المهمة كاملًا، بما فيه Files وInterfaces.
2. افحص الملفات الحالية؛ لا تفترض أن التنفيذ الجزئي صحيح أو مكتمل.
3. اكتب الاختبار المحدد في الخطة وشغله لإثبات الفشل للسبب المتوقع.
4. نفذ أقل تغيير يحقق العقد دون نقل منطق Domain إلى Presentation.
5. شغّل الاختبار المركز ثم اختبارات الميزة ثم `flutter analyze`.
6. شغّل اختبارات Light/Dark وRTL/LTR وAccessibility عندما تمس المهمة واجهة.
7. راجع diff واحفظ فقط ملفات المهمة والملفات المولدة اللازمة.
8. أنشئ commit واحدًا واضحًا، ثم علّم المهمة `[x]` في هذا الملف مع سطر دليل مختصر في سجل التنفيذ.
9. بعد كل 2–3 مهام، شغّل `flutter test` كاملًا قبل المتابعة.
10. لا تبدأ أول مهمة في المرحلة التالية قبل اجتياز بوابة المرحلة الحالية.

## 7. أوامر التحقق القياسية

```powershell
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
dart run build_runner build
git diff --check
git status --short
```

تضاف أوامر integration وgolden وbuild في المرحلة التي تعرفها خطتها التخصصية، ولا تُشغّل Goldens مع update في بوابة التحقق النهائية.

## 8. سجل التنفيذ

| التاريخ | المهمة | النتيجة | الدليل |
|---|---|---|---|
| 2026-08-01 | D01–D10 | منجز | توحيد وثائق المعمارية والخطط مع مواصفة UI |
| 2026-08-01 | F00 | منجز | Home typed، ربط ViewModel/Connectivity، واختبارات regression |
| 2026-08-01 | F01 | منجز | Flutter 3.44.8، Dart 3.12.2، و28 اختبارًا ناجحًا |
| 2026-08-01 | F02 | منجز | Pub solver دون overrides، code generation ناجح، 28 اختبارًا ناجحًا، و0 Analyzer errors |
| 2026-08-01 | F03-F10 | منجز | اكتمال مرحلة الـ Foundation (Bootstrap, Theme, Localization, Navigation, Preferences) وجميع الاختبارات تنجح |
| 2026-08-01 | A01-A07 | منجز | اكتمال مرحلة المصادقة (Auth Entities, Value Objects, Mock Repo, ViewModels, Pages, Protected Redirects, Integration Tests) |
| 2026-08-01 | تدقيق C/P بعد التنفيذ الجزئي | قيد الاستكمال | إصلاح override قديم في اختبارات Home؛ `flutter analyze` بلا errors/warnings و`flutter test` ناجح 68/68؛ المتبقي يبدأ من C04 ومتطلبات قبول المرحلتين 3 و4 |
| 2026-08-01 | C04 | منجز | توحيد Home حول Catalog ViewModel، إضافة refresh/category selection والمكونات المترجمة، وإثبات Light-English وDark-Arabic و200% وempty/offline؛ الاختبارات 72/72 |
| 2026-08-01 | C05 | منجز | تثبيت required options والتوقيع المرتب وDomain pricing، ورفض المعرفات الدخيلة وتعدد قيم المجموعة واختلاف العملة، مع snapshot immutable؛ الاختبارات 76/76 |
| 2026-08-01 | C06 | منجز | Gallery وmetadata/favorite/rating والخيارات والكمية وشريط شراء safe-area، مع callback typed وتعريب Light/Dark وRTL و200%؛ format نظيف والتحليل بلا warnings والاختبارات 78/78 |
| 2026-08-01 | C07 | منجز | uniqueness عبر Set وتطبيع نتائج Repository، optimistic remove مع rollback، وصفحة empty/grid مترجمة ومثبتة في Dark-Arabic و200%؛ الاختبارات 81/81 |

## 9. تعريف الإنجاز الكامل

يعد المشروع منجزًا فقط عند اكتمال `D01–D10` و`F00–F10` و`A01–A07` و`C01–C08` و`P01–P08` و`W01–W07` و`S01–S07` و`X01–X06` و`Q01–Q08`، واجتياز جميع بوابات المراحل، ونجاح الإصدارين المستهدفين دون إخلال بفكرة التطبيق أو العقود الموجودة في وثائق `doc/`.
