import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/app_shell.dart';
import '../../features/authentication/presentation/pages/forgot_password_page.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/register_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import 'app_route_names.dart';

part 'app_router.g.dart';

// ---------------------------------------------------------------------------
// Temporary placeholder page — used for unimplemented branches.
// Will be replaced as each feature is implemented.
// ---------------------------------------------------------------------------
class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      );
}

// ---------------------------------------------------------------------------
// Router provider
// ---------------------------------------------------------------------------

@riverpod
GoRouter appRouter(Ref ref) => GoRouter(
      initialLocation: AppRoutePaths.home,
      debugLogDiagnostics: true,
      routes: [
        // ── Shell with bottom navigation ──
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => AppShell(
            navigationShell: navigationShell,
          ),
          branches: [
            // ── Home ──
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutePaths.home,
                  name: AppRouteNames.home,
                  builder: (context, state) => const HomePage(),
                ),
              ],
            ),
            // ── Favorites ──
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutePaths.favorites,
                  name: AppRouteNames.favorites,
                  builder: (context, state) =>
                      const _PlaceholderPage(title: 'Favorites'),
                ),
              ],
            ),
            // ── Cart ──
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutePaths.cart,
                  name: AppRouteNames.cart,
                  builder: (context, state) =>
                      const _PlaceholderPage(title: 'Cart'),
                ),
              ],
            ),
            // ── Wallet ──
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutePaths.wallet,
                  name: AppRouteNames.wallet,
                  builder: (context, state) =>
                      const _PlaceholderPage(title: 'Wallet'),
                ),
              ],
            ),
            // ── Profile ──
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutePaths.profile,
                  name: AppRouteNames.profile,
                  builder: (context, state) =>
                      const _PlaceholderPage(title: 'Profile'),
                ),
              ],
            ),
          ],
        ),

        // ── Auth routes (outside shell, no bottom nav) ──
        GoRoute(
          path: AppRoutePaths.signIn,
          name: AppRouteNames.signIn,
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          path: AppRoutePaths.signUp,
          name: AppRouteNames.signUp,
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: AppRoutePaths.forgotPassword,
          name: AppRouteNames.forgotPassword,
          builder: (context, state) => const ForgotPasswordPage(),
        ),
      ],
    );
