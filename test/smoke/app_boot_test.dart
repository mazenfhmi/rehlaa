import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/app/app.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/core/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rehlaa/features/home/data/repositories/mock_home_repository.dart';
import 'package:rehlaa/features/home/domain/entities/home_category.dart';
import 'package:rehlaa/features/home/domain/repositories/home_repository.dart';

void main() {
  testWidgets('app boots without throwing', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          preferenceStorageServiceProvider.overrideWithValue(
            PreferenceStorageService(prefs),
          ),
          homeRepositoryProvider.overrideWithValue(
            const _ImmediateHomeRepository(),
          ),
          isOnlineProvider.overrideWith((ref) => Stream.value(true)),
        ],
        child: const RehlaaApp(),
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}

class _ImmediateHomeRepository implements HomeRepository {
  const _ImmediateHomeRepository();

  @override
  Future<Result<List<HomeCategory>>> getCategories() async =>
      const Success(<HomeCategory>[]);
}
