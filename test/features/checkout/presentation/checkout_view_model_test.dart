import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rehlaa/core/files/picked_file.dart';
import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/features/checkout/data/repositories/mock_checkout_repository.dart';
import 'package:rehlaa/features/checkout/presentation/view_models/checkout_view_model.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class MockConnectivityService extends Mock implements ConnectivityService {}

void main() {
  group('CheckoutViewModel', () {
    late MockConnectivityService mockConnectivityService;
    late ProviderContainer container;

    setUp(() {
      mockConnectivityService = MockConnectivityService();
      when(
        () => mockConnectivityService.isConnected,
      ).thenAnswer((_) async => true);

      container = ProviderContainer(
        overrides: [
          checkoutRepositoryProvider.overrideWithValue(
            MockCheckoutRepository(delay: Duration.zero),
          ),
          connectivityServiceProvider.overrideWithValue(
            mockConnectivityService,
          ),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state loads payment methods and calculates quote', () async {
      const subtotal = Money.sdg(1000000);
      container.listen(checkoutViewModelProvider(subtotal), (_, __) {});

      // Wait for initial load
      await Future<void>.delayed(const Duration(milliseconds: 10));

      final state = container.read(checkoutViewModelProvider(subtotal));
      expect(state.isLoading, false);
      expect(state.paymentMethods.isNotEmpty, true);
      expect(state.banks.isNotEmpty, true);
      expect(state.quote?.grandTotal.minorUnits, 1000000);
    });

    test('cannot submit if offline', () async {
      when(
        () => mockConnectivityService.isConnected,
      ).thenAnswer((_) async => false);
      const subtotal = Money.sdg(1000000);
      container.listen(checkoutViewModelProvider(subtotal), (_, __) {});
      final vm = container.read(checkoutViewModelProvider(subtotal).notifier);

      await Future<void>.delayed(const Duration(milliseconds: 10));

      vm.selectPaymentMethod('cashil_pay'); // Valid method
      await vm.submit();

      final state = container.read(checkoutViewModelProvider(subtotal));
      expect(state.isOffline, true);
      expect(state.submissionError, isNotNull);
    });

    test('can submit bank transfer after all fields provided', () async {
      const subtotal = Money.sdg(1000000);
      container.listen(checkoutViewModelProvider(subtotal), (_, __) {});
      final vm = container.read(checkoutViewModelProvider(subtotal).notifier);

      await Future<void>.delayed(const Duration(milliseconds: 10));

      vm
        ..selectPaymentMethod('bank_transfer')
        ..setOperationNumber('123456')
        ..setReceipt(
          const PickedFile(
            path: 'test',
            name: 'test.jpg',
            mimeType: 'image/jpeg',
            sizeBytes: 100,
          ),
        );
      await vm.selectBank('bok');

      final stateBefore = container.read(checkoutViewModelProvider(subtotal));
      expect(stateBefore.canSubmit, true);

      await vm.submit();

      final stateAfter = container.read(checkoutViewModelProvider(subtotal));
      expect(stateAfter.isSuccess, true);
      expect(stateAfter.submissionError, isNull);
    });
  });
}
