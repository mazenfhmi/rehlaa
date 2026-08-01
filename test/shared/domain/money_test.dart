import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

void main() {
  group('Money', () {
    test('adds amounts with the same currency', () {
      const left = Money.sdg(500000);
      const right = Money.sdg(100000);
      expect((left + right).minorUnits, 600000);
    });

    test('subtracts amounts with the same currency', () {
      const left = Money.sdg(500000);
      const right = Money.sdg(100000);
      expect((left - right).minorUnits, 400000);
    });

    test('rejects mixed currencies on addition', () {
      expect(
        () =>
            const Money(currencyCode: 'SDG', minorUnits: 1) +
            const Money(currencyCode: 'USD', minorUnits: 1),
        throwsStateError,
      );
    });

    test('rejects mixed currencies on subtraction', () {
      expect(
        () =>
            const Money(currencyCode: 'SDG', minorUnits: 1) -
            const Money(currencyCode: 'USD', minorUnits: 1),
        throwsStateError,
      );
    });

    test('equality works', () {
      expect(const Money.sdg(500000), equals(const Money.sdg(500000)));
      expect(const Money.sdg(500000), isNot(equals(const Money.sdg(100000))));
    });
  });
}
