import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehlaa/core/design_system/tokens/app_tokens.dart';
import 'package:rehlaa/generated/l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Layout & navigation components
// Adapted from .desgin-ui/lib/entry_point.dart and screens
// ---------------------------------------------------------------------------

/// Application scaffold wrapper ensuring consistent scaffold background.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body, super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final bool extendBody;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        extendBody: extendBody,
      );
}

// ---------------------------------------------------------------------------

/// App bar matching the reference: no elevation, centered or left title.
class AppPageHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppPageHeader({
    required this.title, super.key,
    this.centerTitle = false,
    this.leading,
    this.actions,
    this.bottom,
    this.backgroundColor,
  });

  final String title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(title),
        centerTitle: centerTitle,
        leading: leading,
        actions: actions,
        backgroundColor: backgroundColor,
        bottom: bottom,
      );
}

// ---------------------------------------------------------------------------
// Bottom navigation — matching entry_point.dart with SVG icons
// ---------------------------------------------------------------------------

/// Bottom navigation item definition for [AppBottomNavigation].
class AppNavItem {
  const AppNavItem({
    required this.svgPath,
    required this.label,
  });

  final String svgPath;
  final String label;
}

/// Bottom navigation bar using SVG icons, matching the reference design.
class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    required this.items, required this.currentIndex, required this.onTap, super.key,
    this.cartBadgeCount = 0,
    this.cartTabIndex = 3,
  });

  final List<AppNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int cartBadgeCount;
  final int cartTabIndex;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF101015) : AppColors.white;

    SvgPicture svgIcon(String src, {Color? color}) => SvgPicture.asset(
          src,
          height: 24,
          colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context)
                    .iconTheme
                    .color!
                    .withValues(alpha: isDark ? 0.3 : 1),
            BlendMode.srcIn,
          ),
        );

    Widget buildCartIcon({required bool isActive}) {
      final iconColor = isActive ? AppColors.primary : null;
      final icon = svgIcon(items[cartTabIndex].svgPath, color: iconColor);
      if (cartBadgeCount <= 0) return icon;
      return Stack(
        clipBehavior: Clip.none,
        children: [
          icon,
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
              child: Text(
                '$cartBadgeCount',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      color: bgColor,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: bgColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.transparent,
        items: items.asMap().entries.map((e) {
          final i = e.key;
          final item = e.value;
          if (i == cartTabIndex) {
            return BottomNavigationBarItem(
              icon: buildCartIcon(isActive: false),
              activeIcon: buildCartIcon(isActive: true),
              label: item.label,
            );
          }
          return BottomNavigationBarItem(
            icon: svgIcon(item.svgPath),
            activeIcon: svgIcon(item.svgPath, color: AppColors.primary),
            label: item.label,
          );
        }).toList(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------

/// Horizontal divider with reference styling.
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height = 1,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
  });

  final double height;
  final double indent;
  final double endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) => Divider(
        height: height,
        thickness: height,
        indent: indent,
        endIndent: endIndent,
        color: color ?? Theme.of(context).dividerColor,
      );
}

// ---------------------------------------------------------------------------

/// Section header: title + optional "See all" action.
class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    required this.title, super.key,
    this.trailing,
    this.onTrailingTap,
    this.trailingLabel,
    this.padding = const EdgeInsetsDirectional.symmetric(
      horizontal: AppSpacing.base,
      vertical: AppSpacing.sm,
    ),
  });

  final String title;
  final Widget? trailing;
  final VoidCallback? onTrailingTap;
  final String? trailingLabel;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            if (trailing != null)
              trailing!
            else if (onTrailingTap != null)
              TextButton(
                onPressed: onTrailingTap,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                child: Text(trailingLabel ?? l10n.seeAllLabel),
              ),
          ],
        ),
      );
  }
}

// ---------------------------------------------------------------------------

/// Consistent horizontal page padding (EdgeInsetsDirectional for RTL support).
class AppResponsivePadding extends StatelessWidget {
  const AppResponsivePadding({
    required this.child, super.key,
    this.horizontal = AppSpacing.base,
    this.vertical = 0,
  });

  final Widget child;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: child,
      );
}

// ---------------------------------------------------------------------------
// Offline banner — shown when device has no connectivity
// ---------------------------------------------------------------------------

/// Banner displayed at the top of pages when the device is offline.
class AppOfflineBanner extends StatelessWidget {
  const AppOfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
        width: double.infinity,
        color: AppColors.warning,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          children: [
            const Icon(Icons.wifi_off_rounded, size: 16, color: AppColors.white),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                l10n.offlineMessage,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ),
          ],
        ),
      );
  }
}
