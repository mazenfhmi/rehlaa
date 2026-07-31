import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../core/design_system/tokens/app_tokens.dart';

// ---------------------------------------------------------------------------
// AppShell — Persistent bottom navigation shell for 5 branches
// Foundation plan Task 9
// ---------------------------------------------------------------------------

/// Bottom navigation item model for the shell.
class _ShellNavItem {
  const _ShellNavItem({
    required this.label,
    required this.svgPath,
  });

  final String label;
  final String svgPath;
}

const List<_ShellNavItem> _navItems = [
  _ShellNavItem(label: 'Home', svgPath: 'assets/icons/Home.svg'),
  _ShellNavItem(label: 'Favorites', svgPath: 'assets/icons/Heart.svg'),
  _ShellNavItem(label: 'Cart', svgPath: 'assets/icons/Buy.svg'),
  _ShellNavItem(label: 'Wallet', svgPath: 'assets/icons/Wallet.svg'),
  _ShellNavItem(label: 'Profile', svgPath: 'assets/icons/Profile.svg'),
];

/// The persistent shell wrapping the bottom navigation and its indexed branches.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF101015) : AppColors.white,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor:
              Theme.of(context).iconTheme.color?.withValues(alpha: 0.4),
          items: _navItems.asMap().entries.map((entry) {
            final i = entry.key;
            final item = entry.value;
            final isActive = i == navigationShell.currentIndex;
            final color = isActive ? AppColors.primary : null;

            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.svgPath,
                height: 24,
                colorFilter: ColorFilter.mode(
                  color ??
                      Theme.of(context)
                          .iconTheme
                          .color!
                          .withValues(alpha: isDark ? 0.4 : 0.6),
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                item.svgPath,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              label: item.label,
            );
          }).toList(),
        ),
      ),
    );
  }
}
