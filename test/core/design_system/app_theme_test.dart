import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehlaa/core/design_system/design_system.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  double contrast(Color foreground, Color background) {
    final lighter =
        foreground.computeLuminance() > background.computeLuminance()
        ? foreground.computeLuminance()
        : background.computeLuminance();
    final darker = foreground.computeLuminance() > background.computeLuminance()
        ? background.computeLuminance()
        : foreground.computeLuminance();
    return (lighter + .05) / (darker + .05);
  }

  test('light theme exposes approved semantic colors', () {
    final scheme = AppTheme.lightFor(const Locale('en')).colorScheme;
    expect(scheme.primary, const Color(0xFF00796B));
    expect(scheme.secondary, const Color(0xFF0288D1));
    expect(scheme.tertiary, const Color(0xFFEF6C00));
    expect(scheme.surface, const Color(0xFFFFFFFF));
  });

  test('dark theme exposes teal-tinted surfaces', () {
    final theme = AppTheme.darkFor(const Locale('ar'));
    expect(theme.scaffoldBackgroundColor, const Color(0xFF071816));
    expect(theme.colorScheme.primary, const Color(0xFF5CEAD4));
    expect(theme.colorScheme.surface, const Color(0xFF0D201D));
    expect(theme.textTheme.bodyMedium?.fontFamily, contains('Cairo'));
  });

  test('primary and surface text meet normal-text contrast', () {
    for (final scheme in <ColorScheme>[
      AppTheme.lightFor(const Locale('en')).colorScheme,
      AppTheme.darkFor(const Locale('ar')).colorScheme,
    ]) {
      expect(
        contrast(scheme.onPrimary, scheme.primary),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        contrast(scheme.onSurface, scheme.surface),
        greaterThanOrEqualTo(4.5),
      );
    }
  });
}
