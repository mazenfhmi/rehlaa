import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/app/app.dart';
import 'package:rehlaa/bootstrap/app_environment.dart';
import 'package:rehlaa/bootstrap/provider_observer.dart';
import 'package:rehlaa/core/logging/app_logger.dart';
import 'package:rehlaa/core/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Initializes all platform services and starts the application.
///
/// All async initialization is done here — `main.dart` remains a single line.
/// Error handling is global via [FlutterError.onError].
Future<void> bootstrap({required AppEnvironment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize shared preferences.
  final prefs = await SharedPreferences.getInstance();

  // Forward Flutter framework errors to error reporting.
  FlutterError.onError = (details) {
    AppLogger.error(
      'Flutter Error: ${details.exceptionAsString()}',
      details.exception,
      details.stack,
    );
    FlutterError.presentError(details);
  };

  // Forward uncaught asynchronous errors.
  PlatformDispatcher.instance.onError = (error, stack) {
    AppLogger.error('Unhandled Async Error: $error', error, stack);
    return true;
  };

  AppLogger.info('Rehlaa starting [${environment.label}]');

  runApp(
    ProviderScope(
      observers: [
        if (environment.enableDiagnostics) const AppProviderObserver(),
      ],
      overrides: [
        preferenceStorageServiceProvider.overrideWithValue(
          PreferenceStorageService(prefs),
        ),
      ],
      child: const RehlaaApp(),
    ),
  );
}
