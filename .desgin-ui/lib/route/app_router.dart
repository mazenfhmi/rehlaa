import 'package:go_router/go_router.dart';
import 'package:shop/entry_point.dart';
import 'screen_export.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/$onboardingScreenRoute',
  routes: [
    GoRoute(
      path: '/$onboardingScreenRoute',
      name: onboardingScreenRoute,
      builder: (context, state) => const OnBordingScreen(),
    ),
    GoRoute(
      path: '/$logInScreenRoute',
      name: logInScreenRoute,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/$signUpScreenRoute',
      name: signUpScreenRoute,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/$passwordRecoveryScreenRoute',
      name: passwordRecoveryScreenRoute,
      builder: (context, state) => const PasswordRecoveryScreen(),
    ),
    GoRoute(
      path: '/$entryPointScreenRoute',
      name: entryPointScreenRoute,
      builder: (context, state) => const EntryPoint(),
    ),
    GoRoute(
      path: '/$productDetailsScreenRoute',
      name: productDetailsScreenRoute,
      builder: (context, state) {
        final isProductAvailable = state.extra as bool? ?? true;
        return ProductDetailsScreen(isProductAvailable: isProductAvailable);
      },
    ),
    GoRoute(
      path: '/$productReviewsScreenRoute',
      name: productReviewsScreenRoute,
      builder: (context, state) => const ProductReviewsScreen(),
    ),
    GoRoute(
      path: '/$homeScreenRoute',
      name: homeScreenRoute,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/$discoverScreenRoute',
      name: discoverScreenRoute,
      builder: (context, state) => const DiscoverScreen(),
    ),
    GoRoute(
      path: '/$onSaleScreenRoute',
      name: onSaleScreenRoute,
      builder: (context, state) => const OnSaleScreen(),
    ),
    GoRoute(
      path: '/$kidsScreenRoute',
      name: kidsScreenRoute,
      builder: (context, state) => const KidsScreen(),
    ),
    GoRoute(
      path: '/$searchScreenRoute',
      name: searchScreenRoute,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/$bookmarkScreenRoute',
      name: bookmarkScreenRoute,
      builder: (context, state) => const BookmarkScreen(),
    ),
    GoRoute(
      path: '/$profileScreenRoute',
      name: profileScreenRoute,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/$userInfoScreenRoute',
      name: userInfoScreenRoute,
      builder: (context, state) => const UserInfoScreen(),
    ),
    GoRoute(
      path: '/$notificationsScreenRoute',
      name: notificationsScreenRoute,
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/$noNotificationScreenRoute',
      name: noNotificationScreenRoute,
      builder: (context, state) => const NoNotificationScreen(),
    ),
    GoRoute(
      path: '/$enableNotificationScreenRoute',
      name: enableNotificationScreenRoute,
      builder: (context, state) => const EnableNotificationScreen(),
    ),
    GoRoute(
      path: '/$notificationOptionsScreenRoute',
      name: notificationOptionsScreenRoute,
      builder: (context, state) => const NotificationOptionsScreen(),
    ),
    GoRoute(
      path: '/$addressesScreenRoute',
      name: addressesScreenRoute,
      builder: (context, state) => const AddressesScreen(),
    ),
    GoRoute(
      path: '/$ordersScreenRoute',
      name: ordersScreenRoute,
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: '/$preferencesScreenRoute',
      name: preferencesScreenRoute,
      builder: (context, state) => const PreferencesScreen(),
    ),
    GoRoute(
      path: '/$emptyWalletScreenRoute',
      name: emptyWalletScreenRoute,
      builder: (context, state) => const EmptyWalletScreen(),
    ),
    GoRoute(
      path: '/$walletScreenRoute',
      name: walletScreenRoute,
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: '/$cartScreenRoute',
      name: cartScreenRoute,
      builder: (context, state) => const CartScreen(),
    ),
  ],
  errorBuilder: (context, state) => const OnBordingScreen(),
);
