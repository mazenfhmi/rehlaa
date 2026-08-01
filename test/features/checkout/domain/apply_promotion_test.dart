import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/checkout/domain/use_cases/apply_promotion.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  group('ApplyPromotion', () {
    test('returns correct discount for valid coupon', () {
      final applyPromo = ApplyPromotion();

      final result = applyPromo(code: 'SAVE10K ');

      expect(result.isSuccess, true);
      expect((result as Success<Money>).data.minorUnits, 1000000); // 10,000 SDG
    });

    test('returns correct discount for valid referral', () {
      final applyPromo = ApplyPromotion();

      final result = applyPromo(code: 'ref-a1b2c3'); // Case-insensitive

      expect(result.isSuccess, true);
      expect((result as Success<Money>).data.minorUnits, 500000); // 5,000 SDG
    });

    test('returns failure for invalid code', () {
      final applyPromo = ApplyPromotion();

      final result = applyPromo(code: 'INVALID');

      expect(result.isFailure, true);
      expect((result as Failure).failure is ValidationFailure, true);
      expect((result as Failure).failure.message, 'Invalid or expired code');
    });
  });
}
