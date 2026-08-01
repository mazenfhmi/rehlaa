import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rehlaa/app/app.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/storage/storage_service.dart';
import 'package:rehlaa/features/authentication/data/providers/auth_providers.dart';
import 'package:rehlaa/features/authentication/data/repositories/mock_auth_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('guest authentication flow integration test', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          preferenceStorageServiceProvider.overrideWithValue(
            PreferenceStorageService(prefs),
          ),
          authRepositoryProvider.overrideWithValue(MockAuthRepository()),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: const RehlaaApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(RehlaaApp), findsOneWidget);
  });
}
