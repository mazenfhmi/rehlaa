import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/checkout/domain/entities/checkout_quote.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  group('CheckoutQuote invariants', () {
    test('external payable never becomes negative', () {
      final quote = CheckoutQuote.calculate(
        subtotal: const Money.sdg(1000000), // 10,000 SDG
        couponDiscount: const Money.sdg(0),
        referralDiscount: const Money.sdg(0),
        walletBalance: const Money.sdg(2000000), // 20,000 SDG
        useWallet: true,
      );

      // Total payable is 10,000. Wallet has 20,000. Wallet applied should be 10,000, external payable 0.
      expect(quote.externalPayable.minorUnits, 0);
      expect(quote.walletApplied.minorUnits, 1000000);
      expect(quote.grandTotal.minorUnits, 1000000);
    });

    test('coupon and referral apply correctly', () {
      final quote = CheckoutQuote.calculate(
        subtotal: const Money.sdg(1500000), // 15,000
        couponDiscount: const Money.sdg(200000), // 2,000
        referralDiscount: const Money.sdg(100000), // 1,000
        walletBalance: const Money.sdg(0),
        useWallet: false,
      );

      expect(quote.externalPayable.minorUnits, 1200000); // 12,000
    });

    test('deductions order: coupon -> referral -> wallet', () {
      final quote = CheckoutQuote.calculate(
        subtotal: const Money.sdg(1350000), // 13,500
        couponDiscount: const Money.sdg(1000000), // 10,000
        referralDiscount: const Money.sdg(500000), // 5,000
        walletBalance: const Money.sdg(500000), // 5,000
        useWallet: true,
      );

      // After coupon (10k), remaining is 3.5k.
      // Referral provides 5k, but only 3.5k is remaining, so referral applies 3.5k.
      // Wallet provides 5k, but remaining is 0, so wallet applies 0.
      expect(quote.couponDiscount.minorUnits, 1000000);
      expect(quote.referralDiscount.minorUnits, 350000);
      expect(quote.walletApplied.minorUnits, 0);
      expect(quote.externalPayable.minorUnits, 0);
    });
  });
}
