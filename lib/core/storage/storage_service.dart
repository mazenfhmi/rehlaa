import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rehlaa/core/logging/app_logger.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_service.g.dart';

// ---------------------------------------------------------------------------
// Secure Storage — auth tokens, credentials
// ---------------------------------------------------------------------------

/// Wraps [FlutterSecureStorage] for token and credential storage.
///
/// Keys should be declared as constants in [SecureStorageKeys].
/// Never store PII or large payloads here.
class SecureStorageService {
  SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  Future<Result<void>> write({
    required String key,
    required String value,
  }) async {
    try {
      await _storage.write(key: key, value: value);
      return const Success(null);
    } on Exception catch (e) {
      AppLogger.error('SecureStorage write failed for key=$key', e);
      return const Failure(StorageFailure(message: 'Failed to write to secure storage.'));
    }
  }

  Future<Result<String?>> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      return Success(value);
    } on Exception catch (e) {
      AppLogger.error('SecureStorage read failed for key=$key', e);
      return const Failure(StorageFailure(message: 'Failed to read from secure storage.'));
    }
  }

  Future<Result<void>> delete(String key) async {
    try {
      await _storage.delete(key: key);
      return const Success(null);
    } on Exception catch (e) {
      AppLogger.error('SecureStorage delete failed for key=$key', e);
      return const Failure(StorageFailure(message: 'Failed to delete from secure storage.'));
    }
  }

  Future<Result<void>> deleteAll() async {
    try {
      await _storage.deleteAll();
      return const Success(null);
    } on Exception catch (e) {
      AppLogger.error('SecureStorage deleteAll failed', e);
      return const Failure(StorageFailure(message: 'Failed to clear secure storage.'));
    }
  }
}

/// Secure storage key constants.
abstract final class SecureStorageKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
}

@riverpod
SecureStorageService secureStorageService(Ref ref) => SecureStorageService(
      const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      ),
    );

// ---------------------------------------------------------------------------
// Preference Storage — theme, language, non-sensitive cache
// ---------------------------------------------------------------------------

/// Wraps [SharedPreferences] for non-sensitive user preferences and cache.
///
/// Keys should be declared in [PreferenceKeys].
class PreferenceStorageService {
  PreferenceStorageService(this._prefs);

  final SharedPreferences _prefs;

  String? getString(String key) => _prefs.getString(key);
  bool? getBool(String key) => _prefs.getBool(key);
  int? getInt(String key) => _prefs.getInt(key);

  Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  Future<bool> setBool(String key, {required bool value}) =>
      _prefs.setBool(key, value);

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);

  Future<bool> remove(String key) => _prefs.remove(key);

  Future<bool> clear() => _prefs.clear();
}

/// Shared preferences key constants.
abstract final class PreferenceKeys {
  static const String themeMode = 'theme_mode';
  static const String locale = 'locale';
  static const String onboardingCompleted = 'onboarding_completed';
}

@riverpod
PreferenceStorageService preferenceStorageService(Ref ref) {
  // SharedPreferences must be initialized before this provider is accessed.
  // The bootstrap phase calls SharedPreferences.getInstance() and stores it.
  throw UnimplementedError(
    'preferenceStorageService must be overridden in ProviderScope with the '
    'initialized SharedPreferences instance.',
  );
}
