import 'package:flutter/material.dart';

/// Gradients derived from the active semantic color scheme.
abstract final class AppGradients {
  static LinearGradient hero(ColorScheme colors) => LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [colors.secondary, colors.primary, colors.tertiary],
  );

  static LinearGradient featured(ColorScheme colors) => LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [colors.primaryContainer, colors.surface],
  );
}
