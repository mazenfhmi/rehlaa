import 'package:go_router/go_router.dart';
import 'package:rehlaa/core/navigation/app_route_names.dart';
import 'package:rehlaa/features/authentication/domain/entities/auth_session.dart';

/// Set of protected route paths requiring an authenticated user.
const Set<String> _protectedRoutes = {
  AppRoutePaths.favorites,
  AppRoutePaths.checkout,
  AppRoutePaths.wallet,
  AppRoutePaths.orders,
  AppRoutePaths.notifications,
  AppRoutePaths.editProfile,
  AppRoutePaths.walletTopUp,
  AppRoutePaths.bankTransfer,
};

/// Computes auth redirect location based on active session and target route.
String? authRedirect({
  required AuthSession session,
  required GoRouterState state,
}) {
  final matchedLocation = state.matchedLocation;
  final isProtected = _protectedRoutes.any(
    (route) =>
        matchedLocation == route || matchedLocation.startsWith('$route/'),
  );

  final isAuthRoute = matchedLocation.startsWith('/auth/');

  if (!session.isAuthenticated && isProtected) {
    final encodedReturnPath = Uri.encodeComponent(state.uri.toString());
    return '${AppRoutePaths.signIn}?returnTo=$encodedReturnPath';
  }

  if (session.isAuthenticated && isAuthRoute) {
    final returnTo = state.uri.queryParameters['returnTo'];
    if (returnTo != null && returnTo.startsWith('/')) {
      return Uri.decodeComponent(returnTo);
    }
    return AppRoutePaths.home;
  }

  return null;
}
