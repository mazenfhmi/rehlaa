# تقرير تدقيق مشروع Rehlaa الحالي

**تاريخ التدقيق:** 2026-08-01  
**نقطة الأساس:** `101382c`  
**الفرع:** `main`  
**حالة مساحة العمل عند بدء التدقيق:** نظيفة عدا خطة مواءمة الواجهة الجديدة غير المتتبعة  
**Flutter المثبت:** 3.41.2  
**Dart المثبت:** 3.11.0

## 1. الخلاصة التنفيذية

المشروع تجاوز مرحلة الـScaffold الأولية، لكنه لم يصل بعد إلى Foundation مستقرة يمكن بناء بقية الميزات فوقها بأمان.

الموجود فعليًا:

- Bootstrap وبيئات تشغيل وProvider observer.
- بنية `core/` تشمل Result/Failure، تخزينًا، اتصالًا، ترجمة أولية، Theme، وDesign System أولي.
- `go_router` مع Shell وخمسة فروع تنقل ثابتة.
- Domain وMock Repository وجزء من واجهات المصادقة.
- Home repository وViewModel وHome UI أولية.
- ARB بالعربية والإنجليزية وأكواد ترجمة مولدة.
- 21 اختبار Unit/Widget ناجحًا.

لكن الحالة الحالية لا تُبنى بنجاح بسبب أربعة أخطاء تحليل فعلية، كما أن آخر تعديل لـHome أضعف حدود المعمارية: أزال ارتباط الصفحة بالـViewModel وحالة الاتصال واستبدله ببيانات ثابتة منسوخة من المرجع. لذلك يجب اعتبار المشروع **Foundation جزئية تحتاج تثبيتًا**، لا Foundation مكتملة.

## 2. أدلة التدقيق

| المؤشر | النتيجة |
| --- | ---: |
| ملفات Dart تحت `lib/` | 73 |
| أسطر Dart تحت `lib/` | 6,331 |
| ملفات الاختبار | 6 |
| أسطر الاختبار | 236 |
| الاختبارات المنفذة | 21 ناجحًا |
| نتيجة `flutter analyze` | فشل: 171 ملاحظة |
| أخطاء البناء | 4 |
| التحذيرات | 4 |
| ملاحظات lint/info | 163 |
| الملفات غير المطابقة لـ`dart format` | 19 |
| Integration tests | 0 |
| Golden tests | 0 |
| Accessibility test files | 0 |

لم يتم تشغيل Build Android/iOS/Web لأن نجاح `flutter analyze` بوابة سابقة للبناء، وهي فاشلة حاليًا.

## 3. حالة التنفيذ مقارنة بالخطة

| المجال | الحالة | ما تم | ما بقي أو يحتاج تصحيحًا |
| --- | --- | --- | --- |
| Bootstrap والبيئات | منفذ مبدئيًا | `bootstrap.dart`، environment، observer، تهيئة SharedPreferences | اختبارات بدء التشغيل واستعادة التفضيلات |
| Result/Failure | منفذ ومختبر جزئيًا | Result typed واختبارات أساسية | تحسين رسائل failures ومنع تسريب `toString()` إلى UI |
| التخزين | منفذ كعقود أولية | Secure storage وSharedPreferences provider | ربط Locale/Theme فعليًا بالتخزين واختبار الاستعادة |
| الاتصال | منفذ كخدمة أولية | `ConnectivityService` وProvider | حالة initial connectivity، اختبارات، وربط الواجهات بعد أن أزاله Home الأخير |
| الترجمة | منفذة جزئيًا | ARB عربي/إنجليزي وكود مولد | `AppLocalizations.delegate` غير موصول بالتطبيق، والنصوص لا تزال hard-coded |
| Light/Dark Theme | منفذ جزئيًا | ThemeData للوضعين وPlus Jakarta | ما زال Primary بنفسجيًا، القيم ليست دلالية، لا Cairo، وDark لا يتبع المواصفة الجديدة |
| Design System | مكتبة أولية واسعة | Buttons/Fields/Cards/Feedback/Layout/Image | قيم خام، حالات ناقصة، نصوص hard-coded، `AppCartButton` يستخدم `double` للأموال |
| Router/Shell | منفذ جزئيًا | StatefulShellRoute بخمسة فروع | 4 فروع Placeholder، labels غير مترجمة، لا route protection أو returnTo |
| Home Domain/Data | منفذ جزئيًا | `HomeCategory`، Repository، Mock، ViewModel | الصفحة الحالية لا تقرأها؛ يوجد مصدر ثابت منافس داخل Widget |
| Home UI | منفذة بصريًا جزئيًا | Header، Banner، Categories، Offers، Popular Products | لا تُحلل، غير مترجمة، غير مرتبطة بالبيانات، وفقدت Offline/Loading/Error |
| Authentication Domain | منفذ جيدًا مبدئيًا | Session/User/Repository/Value Objects/Mock | التحقق التفصيلي والسيناريوهات تحتاج توسيعًا |
| Authentication UI | منفذة جزئيًا | Login/Register/Forgot Password | Verify/Reset مفقودان، Register/Forgot يصلان للRepository مباشرة، ولا protected redirect |
| Catalog/Product Details/Favorites/Cart | غير منفذ | مجلدات فقط أو لا ملفات | جميع مهام الخطة |
| Checkout/Payments | غير منفذ | لا ملفات | جميع مهام الخطة |
| Wallet | غير منفذ | لا ملفات | جميع مهام الخطة |
| Profile/Settings | غير منفذ | لا ملفات | جميع مهام الخطة |
| Orders/Notifications/Search/Support | غير منفذ | لا ملفات | جميع مهام المرحلة الثانية |
| Quality/Release | منفذ جزئيًا جدًا | 21 اختبارًا أساسيًا | Analyze clean، Integration، Golden، Accessibility، CI، Builds، Performance |

## 4. أخطاء مانعة للبناء

### P0.1 تعارض اسم `TextDirection`

**المكان:** `lib/core/extensions/extensions.dart:22`

**العرض:** `TextDirection.rtl` لا يُحل إلى enum الخاص بـFlutter.

**السبب الجذري:** الملف يستورد `material.dart` و`intl.dart` دون alias. حزمة `intl` تعرض نوعًا بالاسم نفسه، فيُحل المرجع إلى النوع الخطأ.

**التصحيح المطلوب:** تضييق استيراد intl أو استخدام alias لـ`NumberFormat` و`DateFormat`، مع اختبار extension في RTL وLTR.

### P0.2 بيانات Categories غير typed

**المكان:** `lib/features/home/presentation/widgets/categories_widget.dart:32-34`

**العرض:** ثلاث قيم `dynamic` تُمرر إلى `String` و`IconData?`.

**السبب الجذري:** نسخ نمط `List<Map<String, dynamic>>` من `ui.txt` إلى كود Rehlaa، رغم وجود Entity typed باسم `HomeCategory` وRepository/ViewModel جاهزين.

**التصحيح المطلوب:** حذف مصدر البيانات الثابت المنافس، وجعل Widget يستقبل `List<HomeCategory>` وcallback typed من الصفحة/ViewModel.

## 5. مشكلات صحيحة وظيفيًا لكنها لا تظهر في الاختبارات الحالية

### P1.1 تراجع Home عن المعمارية المثبتة

Commit `101382c` أزال من `HomePage`:

- `ref.watch(homeCategoriesViewModelProvider)`.
- `ref.watch(isOnlineProvider)`.
- `AppAsyncBuilder` وحالات Skeleton/Error.
- اختيار الفئة عبر ViewModel.

واستبدل ذلك بـWidgets ثابتة. النتيجة أن الصفحة أصبحت بصرية فقط ولا تثبت الـVertical Slice المذكورة في الخطة.

### P1.2 حالة نجاح استعادة كلمة المرور غير قابلة للوصول

`ForgotPasswordPage` يعرّف `_isSent` ويعرض واجهة نجاح عندما يكون `true`، لكنه لا يضبطه إلى `true` بعد `Success`. لذلك يظل النموذج ظاهرًا حتى عند نجاح Repository.

### P1.3 تجاوز ViewModel في Register وForgot Password

الصفحتان تقرآن `authRepositoryProvider` مباشرة وتديران `setState`. هذا يخالف حدود الخطة التي تجعل الصفحة رفيعة وتضع submit state داخل ViewModel.

### P1.4 الترجمة مولدة لكنها غير مفعلة

`RehlaaApp` يسجل Flutter delegates العامة فقط، ولا يسجل `AppLocalizations.delegate`. كما أن Shell وصفحات Auth وHome تستخدم نصوصًا إنجليزية ثابتة. تغيير Locale يغير اتجاه Material لكنه لا يترجم محتوى التطبيق.

### P1.5 الثيم الحالي لا يطابق القرار المعتمد

- Primary الحالي `#7B61FF` البنفسجي.
- برتقالي `ui.txt` أضيف كقيم جانبية `ecommerce*` بدل تحويله إلى أدوار دلالية.
- Primary نفسه مستخدم في الوضع الداكن والفاتح.
- زر Dark يستخدم foreground أبيض رغم أن المواصفة المعتمدة تتطلب `#FF9A73` مع foreground داكن.
- `useMaterial3` مضبوط على `false` بينما خطة Foundation تنص على Material 3.

### P1.6 تمثيل الأموال بـ`double`

`AppCartButton.price` وProduct card APIs الحالية تستخدم `double`. هذا يتعارض مباشرة مع قرار الخطة باستخدام `Money.minorUnits` ومنع حسابات المال العائمة.

### P1.7 التفضيلات لا تُستعاد أو تُحفظ

التخزين مهيأ في Bootstrap، لكن `LocaleController` و`ThemeController` يغيران الذاكرة فقط. التعليقات تقول إن الربط سيتم لاحقًا، لذلك لا تبقى اختيارات المستخدم بعد إعادة التشغيل.

### P1.8 حماية المسارات غير منفذة

Router لا يقرأ AuthSession ولا يطبق redirect للمفضلة والسلة/Checkout والمحفظة والملف الشخصي والإشعارات، ولا يحفظ `returnTo`.

## 6. تحسينات جودة مطلوبة

### أولوية عالية

- إعادة Home إلى مصدر حقيقة واحد: Repository → ViewModel → Page → typed widgets.
- تطبيق نظام الألوان الدلالي المعتمد بدل الاحتفاظ بلوحتين متنافستين.
- تشغيل `AppLocalizations` فعليًا وإزالة النصوص المرئية الثابتة.
- إضافة Cairo 400/500/700 وتعريف Typography مناسب للغتين.
- استبدال `double` في مكونات المال بقيمة Money typed أو قيمة منسقة جاهزة للعرض.
- إضافة اختبارات Page لـHome وAuth حتى تُجمع الملفات التي أغفلتها الاختبارات الحالية.

### أولوية متوسطة

- معالجة 4 تحذيرات و163 ملاحظة lint حتى تصبح بوابة Analyze ناجحة.
- تنسيق الملفات التسعة عشر التي اكتشفها `dart format`.
- إزالة imports والمتغيرات غير المستخدمة وcatch العام.
- استخدام قيم Directional في كل موضع أفقي.
- نقل النصوص الافتراضية مثل “See All” و“Try Again” وOffline message إلى ARB أو جعلها required.
- جعل disabled/loading/focus/error حالات تعتمد Theme بدل ألوان وopacity خام.

### أولوية لاحقة بعد ثبات Foundation

- Golden coverage للوضعين واللغتين.
- اختبارات Accessibility و200% text scale.
- Integration flows للمصادقة والتنقل وOffline.
- CI وBuild Android/iOS.
- Profiling وإصلاح rebuilds المثبتة فقط.

## 7. فجوة بيئة التنفيذ

الخطة الحالية تطلب Flutter 3.44.x وDart 3.12.x، بينما البيئة التي تم التحقق منها هي Flutter 3.41.2 وDart 3.11.0. يجب أن تبقى هذه الفجوة ظاهرة في الخطة كأحد خيارين صريحين:

1. ترقية SDK أولًا ثم تثبيت الإصدارات المخططة.
2. اعتماد 3.41.2/3.11.0 كخط أساس مؤقت وتحديث قيود الحزم وفقًا له.

لا ينبغي أن تدعي الخطة نجاح Build على Toolchain غير مثبتة.

## 8. ترتيب العمل الموصى به

1. **بوابة الاستقرار:** إصلاح أخطاء البناء الأربعة، إعادة Home إلى ViewModel، ثم جعل Analyze ناجحًا.
2. **بوابة الهوية:** تطبيق Semantic Light/Dark، Typography العربية/الإنجليزية، وتفعيل AppLocalizations.
3. **بوابة Foundation:** persistence، protected routing، feedback states، واختبارات Design System/Home.
4. **إكمال المصادقة:** Register/Forgot ViewModels، Verify/Reset، redirect/returnTo، Integration test.
5. **Catalog ثم Cart:** بعد نجاح بوابات Foundation والمصادقة فقط.
6. **Checkout ثم Wallet:** مع Money وOffline guards قبل أي واجهة مالية.
7. **Profile/Settings ثم Phase 2.**
8. **Quality/Release:** Golden، Accessibility، Integration، CI، Builds، ثم Performance.

## 9. حكم التدقيق

لا يُنصح ببدء Catalog أو الدفع قبل تثبيت Foundation الحالية. الأولوية الصحيحة ليست إضافة شاشات جديدة، بل استعادة الحدود المعمارية التي كانت موجودة قبل آخر تعديل Home، ثم تطبيق نظام التصميم المعتمد عبر المكونات الدلالية. بعد ذلك يمكن تنفيذ الخطط المتبقية دون إعادة عمل واسعة.
