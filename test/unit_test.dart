import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/core/validation/validators.dart';

void main() {
  group('Result Monad', () {
    test('Success returns value and isSuccess is true', () {
      const result = Success('hello');
      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.data, equals('hello'));
    });

    test('Failure returns AppFailure and isFailure is true', () {
      const failure = Failure<String>(NetworkFailure(message: 'No internet'));
      expect(failure.isSuccess, isFalse);
      expect(failure.isFailure, isTrue);
      expect(failure.failure.message, equals('No internet'));
    });
  });

  group('Validators', () {
    test('validateEmail handles valid and invalid emails', () {
      expect(validateEmail('test@example.com'), isNull);
      expect(validateEmail('invalid-email'), isNotNull);
      expect(validateEmail(''), isNotNull);
      expect(validateEmail(null), isNotNull);
    });

    test('validatePassword enforces min length and rules', () {
      expect(validatePassword('Pass1234'), isNull);
      expect(validatePassword('short'), isNotNull);
      expect(validatePassword('12345678'), isNotNull); // no letter
      expect(validatePassword('abcdefgh'), isNotNull); // no digit
    });

    test('validatePhone validates phone format', () {
      expect(validatePhone('+966500000000'), isNull);
      expect(validatePhone('0500000000'), isNull);
      expect(validatePhone('123'), isNotNull);
    });
  });
}
