import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// Text field components — adapted from .desgin-ui input_decoration_theme
// ---------------------------------------------------------------------------

/// Standard text input matching the reference input style:
/// filled lightGrey background, no border, focus = primary border.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.prefixSvgIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.autofillHints,
    this.focusNode,
    this.initialValue,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? prefixIcon;
  final String? prefixSvgIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool enabled;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final String? initialValue;

  Widget? _buildPrefix(BuildContext context) {
    if (prefixSvgIcon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md,
        ),
        child: SvgPicture.asset(
          prefixSvgIcon!,
          height: 20,
          colorFilter: ColorFilter.mode(
            Theme.of(context).inputDecorationTheme.hintStyle?.color ??
                AppColors.grey,
            BlendMode.srcIn,
          ),
        ),
      );
    }
    return prefixIcon;
  }

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    validator: validator,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    enabled: enabled,
    maxLines: maxLines,
    maxLength: maxLength,
    inputFormatters: inputFormatters,
    autofillHints: autofillHints,
    focusNode: focusNode,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: _buildPrefix(context),
      suffixIcon: suffixIcon,
      counterText: maxLength != null ? '' : null,
    ),
  );
}

// ---------------------------------------------------------------------------

/// Password field with show/hide toggle.
class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.controller,
    this.label = 'Password',
    this.hint = '••••••••',
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: widget.controller,
    obscureText: _obscure,
    keyboardType: TextInputType.visiblePassword,
    textInputAction: widget.textInputAction,
    validator: widget.validator,
    onChanged: widget.onChanged,
    focusNode: widget.focusNode,
    autofillHints: widget.autofillHints,
    decoration: InputDecoration(
      labelText: widget.label,
      hintText: widget.hint,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md,
        ),
        child: SvgPicture.asset(
          'assets/icons/Lock.svg',
          height: 20,
          colorFilter: ColorFilter.mode(
            Theme.of(context).inputDecorationTheme.hintStyle?.color ??
                AppColors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: SvgPicture.asset(
          'assets/icons/Show.svg',
          height: 20,
          colorFilter: ColorFilter.mode(
            _obscure ? AppColors.grey : AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    ),
  );
}

// ---------------------------------------------------------------------------

/// Search field matching the reference search bar style.
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    this.controller,
    this.hint = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: controller,
    autofocus: autofocus,
    focusNode: focusNode,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
    onChanged: onChanged,
    onFieldSubmitted: onSubmitted,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md,
        ),
        child: SvgPicture.asset(
          'assets/icons/Search.svg',
          height: 20,
          colorFilter: ColorFilter.mode(
            Theme.of(context).inputDecorationTheme.hintStyle?.color ??
                AppColors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
    ),
  );
}
