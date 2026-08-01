import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// Buttons — adapted from .desgin-ui/lib/theme/button_theme.dart
// and .desgin-ui/lib/components/outlined_active_button.dart
// ---------------------------------------------------------------------------

/// Full-width primary elevated button (matches reference ElevatedButton style).
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    required this.label, super.key,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.svgIcon,
    this.backgroundColor,
    this.foregroundColor,
    this.width = double.infinity,
    this.height = 56,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;
  final String? svgIcon; // path to SVG asset
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor ?? AppColors.white,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.white,
                ),
              )
            : _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (svgIcon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(svgIcon!, height: 20, colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
          const SizedBox(width: AppSpacing.sm),
          Text(label),
        ],
      );
    }
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [icon!, const SizedBox(width: AppSpacing.sm), Text(label)],
      );
    }
    return Text(label);
  }
}

// ---------------------------------------------------------------------------

/// Full-width outlined button — matches reference OutlinedButton style.
class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.label, super.key,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.svgIcon,
    this.borderColor,
    this.width = double.infinity,
    this.height = 56,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget? icon;
  final String? svgIcon;
  final Color? borderColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: (onPressed == null || isLoading) ? null : onPressed,
          style: borderColor != null
              ? OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.5, color: borderColor!),
                )
              : null,
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                )
              : svgIcon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(svgIcon!, height: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Text(label),
                      ],
                    )
                  : icon != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [icon!, const SizedBox(width: AppSpacing.sm), Text(label)],
                        )
                      : Text(label),
        ),
      );
}

// ---------------------------------------------------------------------------

/// Outlined button that can be toggled active (filled primary).
/// Adapted from .desgin-ui/lib/components/outlined_active_button.dart
class AppToggleButton extends StatelessWidget {
  const AppToggleButton({
    required this.label, required this.onPressed, super.key,
    this.isActive = false,
    this.width,
    this.height = 40,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isActive;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: onPressed,
          style: isActive
              ? OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  side: const BorderSide(color: AppColors.primary),
                )
              : null,
          child: Text(label),
        ),
      );
}

// ---------------------------------------------------------------------------

/// Text button — reference TextButton style with primary color.
class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    required this.label, super.key,
    this.onPressed,
    this.isLoading = false,
    this.color,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: (onPressed == null || isLoading) ? null : onPressed,
        style: color != null
            ? TextButton.styleFrom(foregroundColor: color)
            : null,
        child: isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(label),
      );
}

// ---------------------------------------------------------------------------

/// Icon-only tappable button (matches reference icon buttons).
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon, super.key,
    this.onPressed,
    this.tooltip,
    this.badgeCount,
    this.color,
    this.size = 24,
  });

  /// Use [icon] for Material icons or [svgPath] for SVG assets.
  factory AppIconButton.svg({
    required String svgPath, Key? key,
    VoidCallback? onPressed,
    String? tooltip,
    int? badgeCount,
    Color? color,
    double size = 24,
  }) =>
      AppIconButton(
        key: key,
        icon: SvgPicture.asset(
          svgPath,
          height: size,
          colorFilter: color != null
              ? ColorFilter.mode(color, BlendMode.srcIn)
              : null,
        ),
        onPressed: onPressed,
        tooltip: tooltip,
        badgeCount: badgeCount,
        size: size,
      );

  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final int? badgeCount;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    Widget btn = IconButton(
      icon: icon,
      onPressed: onPressed,
      tooltip: tooltip,
      iconSize: size,
    );
    if (badgeCount != null && badgeCount! > 0) {
      btn = Badge(label: Text('$badgeCount'), child: btn);
    }
    return btn;
  }
}

// ---------------------------------------------------------------------------
// CartButton — from .desgin-ui/lib/components/cart_button.dart
// ---------------------------------------------------------------------------

/// Buy-Now / Add-to-Cart bottom bar button matching the design reference.
class AppCartButton extends StatelessWidget {
  const AppCartButton({
    required this.price, required this.onPressed, super.key,
    this.title = 'Buy Now',
    this.subTitle = 'Unit price',
    this.currencySymbol = 'SAR',
  });

  final double price;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.base,
            vertical: AppRadius.sm,
          ),
          child: SizedBox(
            height: 64,
            child: Material(
              color: AppColors.primary,
              clipBehavior: Clip.hardEdge,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
              ),
              child: InkWell(
                onTap: onPressed,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.base,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${price.toStringAsFixed(2)} $currencySymbol',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.white),
                            ),
                            Text(
                              subTitle,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'PlusJakarta',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        color: Colors.black.withValues(alpha: 0.15),
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
