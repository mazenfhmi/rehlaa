import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_service.g.dart';

/// Provides the current connectivity status as a stream.
///
/// Used by ViewModels to guard transactional operations and display
/// the [AppOfflineBanner] when the device is offline.
class ConnectivityService {
  ConnectivityService(this._connectivity);

  final Connectivity _connectivity;

  /// Emits `true` when online, `false` when offline.
  Stream<bool> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged.map(
        (results) => results.any(
          (r) => r != ConnectivityResult.none,
        ),
      );

  /// Returns `true` if the device currently has connectivity.
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }
}

@riverpod
ConnectivityService connectivityService(Ref ref) =>
    ConnectivityService(Connectivity());

/// A stream provider that emits the current online status.
/// Widgets and ViewModels can watch this to react to connectivity changes.
@riverpod
Stream<bool> isOnline(Ref ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.onConnectivityChanged;
}
