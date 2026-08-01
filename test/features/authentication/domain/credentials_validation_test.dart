import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/features/authentication/domain/value_objects/email_address.dart';
import 'package:rehlaa/features/authentication/domain/value_objects/password.dart';

void main() {
  group('EmailAddress Value Object', () {
    test('accepts valid email address', () {
      final email = EmailAddress.parse('  user@example.com  ');
      expect(email.value, equals('user@example.com'));
    });

    test('rejects malformed email address', () {
      expect(
        () => EmailAddress.parse('invalid-email'),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('Password Value Object', () {
    test('accepts valid strong password', () {
      final password = Password.parse('Strong123');
      expect(password.value, equals('Strong123'));
    });

    test('rejects short password', () {
      expect(() => Password.parse('Pass1'), throwsA(isA<FormatException>()));
    });

    test('rejects password without numbers', () {
      expect(
        () => Password.parse('PasswordNoDigits'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
