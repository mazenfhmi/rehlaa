import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/checkout/data/repositories/mock_checkout_repository.dart';
import 'package:rehlaa/features/checkout/domain/entities/checkout_quote.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  group('MockCheckoutRepository', () {
    late MockCheckoutRepository repo;

    setUp(() {
      repo = MockCheckoutRepository(delay: Duration.zero);
    });

    test('returns bank of khartoum details correctly', () async {
      final result = await repo.getBankAccount('bok');

      expect(result.isSuccess, true);
      final account = result.dataOrThrow;

      expect(account.accountNumber, '8199246');
      expect(account.bankId, 'bok');
    });

    test('returns failure for unknown bank', () async {
      final result = await repo.getBankAccount('unknown');

      expect(result.isFailure, true);
    });

    test('submits bank transfer mock successfully', () async {
      const quote = CheckoutQuote(
        subtotal: Money.sdg(100),
        couponDiscount: Money.sdg(0),
        referralDiscount: Money.sdg(0),
        walletApplied: Money.sdg(0),
        externalPayable: Money.sdg(100),
        grandTotal: Money.sdg(100),
      );

      final result = await repo.submitBankTransfer(
        quote: quote,
        bankId: 'bok',
        operationNumber: '12345',
        receiptFilePath: 'path/to/receipt.jpg',
      );

      expect(result.isSuccess, true);
    });
  });
}
