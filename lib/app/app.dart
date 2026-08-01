import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/design_system/design_system.dart';
import 'package:rehlaa/core/design_system/theme/theme_controller.dart';
import 'package:rehlaa/core/localization/locale_controller.dart';
import 'package:rehlaa/core/navigation/app_router.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

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
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
