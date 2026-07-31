import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/design_system/design_system.dart';
import '../core/design_system/theme/theme_controller.dart';
import '../core/localization/locale_controller.dart';
import '../core/navigation/app_router.dart';

/// Root application widget.
///
/// Uses [MaterialApp.router] with go_router, runtime locale switching via
/// [LocaleController], and runtime theme switching via [ThemeController].
class RehlaaApp extends ConsumerWidget {
  const RehlaaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeControllerProvider);
    final themeMode = ref.watch(themeControllerProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Rehlaa',
      debugShowCheckedModeBanner: false,

      // Router
      routerConfig: router,

      // Theme — from design reference (.desgin-ui)
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,

      // Localization — Arabic (default) + English
      locale: locale,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
