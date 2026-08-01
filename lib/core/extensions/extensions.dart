import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

// ---------------------------------------------------------------------------
// BuildContext extensions
// ---------------------------------------------------------------------------

extension BuildContextX on BuildContext {
  /// Shorthand for [Theme.of(context)].
  ThemeData get theme => Theme.of(this);

  /// Shorthand for [Theme.of(context).colorScheme].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Shorthand for [Theme.of(context).textTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Shorthand for [MediaQuery.sizeOf(context)].
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Returns `true` if the layout is in RTL direction.
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  /// Shorthand for [ScaffoldMessenger.of(context).showSnackBar].
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colorScheme.error : null,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Unfocuses the current focus node (hides keyboard).
  void unfocus() => FocusScope.of(this).unfocus();
}

// ---------------------------------------------------------------------------
// String extensions
// ---------------------------------------------------------------------------

extension StringX on String {
  /// Capitalizes the first letter of each word.
  String get titleCase => split(' ')
      .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
      .join(' ');

  /// Returns `true` if this is a valid email address.
  bool get isValidEmail => RegExp(
    r'^[\w.+-]+@[\w-]+\.[a-z]{2,}$',
    caseSensitive: false,
  ).hasMatch(trim());

  /// Trims and returns `null` if empty, otherwise returns the trimmed value.
  String? get nullIfEmpty => trim().isEmpty ? null : trim();
}

extension NullableStringX on String? {
  /// Returns `true` if null or empty after trimming.
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
}

// ---------------------------------------------------------------------------
// Num extensions — currency and display formatting
// ---------------------------------------------------------------------------

extension NumX on num {
  /// Formats as SAR currency: "125.00 ر.س"
  String toSar({String locale = 'ar'}) => NumberFormat.currency(
    locale: locale,
    symbol: 'ر.س',
    decimalDigits: 2,
  ).format(this);

  /// Formats as a simple decimal: "125.00"
  String toDecimal({int decimalDigits = 2}) =>
      NumberFormat.decimalPattern().format(this);

  /// Returns `true` if this represents a positive discount.
  bool get hasDiscount => this > 0;
}

// ---------------------------------------------------------------------------
// DateTime extensions
// ---------------------------------------------------------------------------

extension DateTimeX on DateTime {
  /// Returns a localized date string, e.g. "31 يوليو 2026" or "Jul 31, 2026".
  String toDisplayDate({String locale = 'ar'}) =>
      DateFormat.yMMMMd(locale).format(this);

  /// Returns relative time: "Just now", "5 min ago", etc.
  String toRelativeTime() {
    final diff = DateTime.now().difference(this);
    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return toDisplayDate();
  }
}

// ---------------------------------------------------------------------------
// List extensions
// ---------------------------------------------------------------------------

extension ListX<T> on List<T> {
  /// Returns the first element or `null` if the list is empty.
  T? get firstOrNull => isEmpty ? null : first;

  /// Returns the last element or `null` if the list is empty.
  T? get lastOrNull => isEmpty ? null : last;

  /// Splits the list into chunks of [size].
  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, (i + size).clamp(0, length)));
    }
    return chunks;
  }

  /// Groups elements by a key derived from [keyOf].
  Map<K, List<T>> groupBy<K>(K Function(T element) keyOf) {
    final map = <K, List<T>>{};
    for (final element in this) {
      (map[keyOf(element)] ??= []).add(element);
    }
    return map;
  }
}
