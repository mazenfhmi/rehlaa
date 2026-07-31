import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/logging/app_logger.dart';

/// Riverpod ProviderObserver that logs provider lifecycle events.
///
/// Only attached when [AppEnvironment.enableDiagnostics] is `true`,
/// keeping production builds free of diagnostic overhead.
class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    AppLogger.verbose(
      '[Riverpod] Added: ${provider.name ?? provider.runtimeType}',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    AppLogger.verbose(
      '[Riverpod] Updated: ${provider.name ?? provider.runtimeType}',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    AppLogger.error(
      '[Riverpod] Failed: ${provider.name ?? provider.runtimeType}',
      error,
      stackTrace,
    );
  }
}
