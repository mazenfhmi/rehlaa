/// Centralized route name constants.
///
/// Use these instead of string literals in navigation calls to prevent typos.
abstract final class AppRouteNames {
  // Shell branches
  static const home = 'home';
  static const favorites = 'favorites';
  static const cart = 'cart';
  static const wallet = 'wallet';
  static const profile = 'profile';

  // Auth
  static const signIn = 'sign-in';
  static const signUp = 'sign-up';
  static const forgotPassword = 'forgot-password';
  static const resetPassword = 'reset-password';
  static const emailVerification = 'email-verification';

  // Catalog
  static const catalog = 'catalog';
  static const productDetails = 'product-details';

  // Checkout
  static const checkout = 'checkout';

  // Orders
  static const orders = 'orders';
  static const orderDetails = 'order-details';

  // Notifications
  static const notifications = 'notifications';

  // Wallet
  static const walletTopUp = 'wallet-top-up';
  static const bankTransfer = 'bank-transfer';

  // Profile
  static const editProfile = 'edit-profile';
  static const settings = 'settings';
  static const privacyPolicy = 'privacy-policy';
  static const termsOfService = 'terms-of-service';
  static const support = 'support';
}

/// Centralized route path constants.
abstract final class AppRoutePaths {
  static const home = '/home';
  static const favorites = '/favorites';
  static const cart = '/cart';
  static const wallet = '/wallet';
  static const profile = '/profile';

  static const signIn = '/auth/sign-in';
  static const signUp = '/auth/sign-up';
  static const forgotPassword = '/auth/forgot-password';
  static const resetPassword = '/auth/reset-password';
  static const emailVerification = '/auth/verify-email';

  static const catalog = '/catalog';
  static const productDetails = '/product/:id';
  static String productDetailsFor(String id) => '/product/$id';

  static const checkout = '/checkout';
  static const orders = '/orders';
  static const orderDetails = '/orders/:id';

  static const notifications = '/notifications';
  static const walletTopUp = '/wallet/top-up';
  static const bankTransfer = '/wallet/bank-transfer';

  static const editProfile = '/profile/edit';
  static const settings = '/profile/settings';
  static const privacyPolicy = '/profile/privacy';
  static const termsOfService = '/profile/terms';
  static const support = '/profile/support';
}
