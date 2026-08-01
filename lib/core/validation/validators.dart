/// Application-wide validation utilities.
///
/// All validators are pure functions returning `null` on success
/// or a localized-key string on failure. Form fields pass these
/// directly to [TextFormField.validator].
library;

// ---------------------------------------------------------------------------
// Primitive validators
// ---------------------------------------------------------------------------

/// Returns an error message key if [value] is null or empty.
String? validateRequired(String? value, {String field = 'Field'}) {
  if (value == null || value.trim().isEmpty) {
    return '$field is required.';
  }
  return null;
}

/// Returns an error message key if [value] is not a valid email address.
String? validateEmail(String? value) {
  final required = validateRequired(value, field: 'Email');
  if (required != null) return required;
  final regex = RegExp(r'^[\w.+-]+@[\w-]+\.[a-z]{2,}$', caseSensitive: false);
  if (!regex.hasMatch(value!.trim())) {
    return 'Please enter a valid email address.';
  }
  return null;
}

/// Returns an error message if the password does not meet the policy.
///
/// Policy: minimum 8 characters, at least one letter and one digit.
String? validatePassword(String? value) {
  final required = validateRequired(value, field: 'Password');
  if (required != null) return required;
  if (value!.length < 8) return 'Password must be at least 8 characters.';
  if (!RegExp('[A-Za-z]').hasMatch(value)) {
    return 'Password must contain at least one letter.';
  }
  if (!RegExp(r'\d').hasMatch(value)) {
    return 'Password must contain at least one digit.';
  }
  return null;
}

/// Returns an error message if [confirm] does not match [password].
String? validatePasswordConfirm(String? confirm, String password) {
  final required = validateRequired(confirm, field: 'Confirm password');
  if (required != null) return required;
  if (confirm != password) return 'Passwords do not match.';
  return null;
}

/// Returns an error message if [value] is not a valid phone number.
///
/// Accepts digits, spaces, dashes, and an optional leading `+`.
String? validatePhone(String? value) {
  final required = validateRequired(value, field: 'Phone number');
  if (required != null) return required;
  final cleaned = value!.replaceAll(RegExp(r'[\s\-]'), '');
  if (!RegExp(r'^\+?\d{8,15}$').hasMatch(cleaned)) {
    return 'Please enter a valid phone number.';
  }
  return null;
}

/// Returns an error message if [value] is not a positive number.
String? validatePositiveAmount(String? value, {double min = 0.01}) {
  final required = validateRequired(value, field: 'Amount');
  if (required != null) return required;
  final amount = double.tryParse(value!);
  if (amount == null || amount < min) {
    return 'Please enter a valid amount (minimum $min).';
  }
  return null;
}

// ---------------------------------------------------------------------------
// Composable validator
// ---------------------------------------------------------------------------

/// Composes multiple validators — returns the first non-null error.
String? Function(String?) composeValidators(
  List<String? Function(String?)> validators,
) =>
    (value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
