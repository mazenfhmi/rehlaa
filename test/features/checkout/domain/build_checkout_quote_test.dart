import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/checkout/domain/use_cases/build_checkout_quote.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  group('BuildCheckoutQuote', () {
    test('builds quote deterministically', () {
      final buildQuote = BuildCheckoutQuote();

      final quote = buildQuote(
        subtotal: const Money.sdg(1350000), // 13,500
        couponDiscount: const Money.sdg(1000000), // 10,000
        referralDiscount: const Money.sdg(500000), // 5,000
        walletBalance: const Money.sdg(500000), // 5,000
        useWallet: true,
      );

      // Same logic as CheckoutQuote invariants
      expect(quote.couponDiscount.minorUnits, 1000000);
      expect(quote.referralDiscount.minorUnits, 350000); // 3.5k max left
      expect(quote.walletApplied.minorUnits, 0); // 0 left
      expect(quote.externalPayable.minorUnits, 0); // 0 payable
    });
  });
}
