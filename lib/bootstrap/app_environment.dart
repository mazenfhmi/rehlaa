/// Application environment definition.
///
/// Used by bootstrap to decide which implementations and diagnostics to load.
enum AppEnvironment { development, staging, production }

extension AppEnvironmentX on AppEnvironment {
  /// Returns `true` when diagnostics (ProviderObserver, verbose logging) are enabled.
  bool get enableDiagnostics => this != AppEnvironment.production;

  /// Returns `true` when the app should use Mock repositories.
  /// In this phase always `true` (no real backend connected yet).
  bool get useMockRepositories => true;

  /// Human-readable name for logging.
  String get label => switch (this) {
        AppEnvironment.development => 'development',
        AppEnvironment.staging => 'staging',
        AppEnvironment.production => 'production',
      };
}
