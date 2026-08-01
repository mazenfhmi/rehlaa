import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rehlaa/core/logging/app_logger.dart';

/// Riverpod ProviderObserver that logs provider lifecycle events.
///
/// Only attached when [AppEnvironment.enableDiagnostics] is `true`,
/// keeping production builds free of diagnostic overhead.
final class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    AppLogger.verbose(
      '[Riverpod] Added: '
      '${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    AppLogger.verbose(
      '[Riverpod] Updated: '
      '${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    AppLogger.error(
      '[Riverpod] Failed: '
      '${context.provider.name ?? context.provider.runtimeType}',
      error,
      stackTrace,
    );
  }
}
