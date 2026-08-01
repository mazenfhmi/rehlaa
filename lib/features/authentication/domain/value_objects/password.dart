/// Value object representing a validated password.
extension type const Password._(String value) {
  /// Parses and validates [rawPassword].
  ///
  /// Requires: min 8 characters, at least 1 uppercase or lowercase letter and 1 digit.
  /// Throws [FormatException] if invalid.
  factory Password.parse(String rawPassword) {
    if (rawPassword.length < 8) {
      throw const FormatException(
        'Password must be at least 8 characters long.',
      );
    }
    final hasLetter = rawPassword.contains(RegExp('[a-zA-Z]'));
    final hasDigit = rawPassword.contains(RegExp('[0-9]'));
    if (!hasLetter || !hasDigit) {
      throw const FormatException(
        'Password must contain both letters and numbers.',
      );
    }
    return Password._(rawPassword);
  }
}
