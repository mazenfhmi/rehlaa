/// Value object representing a validated email address.
extension type const EmailAddress._(String value) {
  /// Parses and validates [rawEmail].
  ///
  /// Throws [FormatException] if invalid.
  factory EmailAddress.parse(String rawEmail) {
    final trimmed = rawEmail.trim();
    final regex = RegExp(
      r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!regex.hasMatch(trimmed)) {
      throw FormatException('Invalid email address format: "$rawEmail"');
    }
    return EmailAddress._(trimmed);
  }
}
