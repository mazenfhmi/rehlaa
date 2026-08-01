import 'package:rehlaa/features/checkout/domain/entities/checkout_quote.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

class BuildCheckoutQuote {
  CheckoutQuote call({
    required Money subtotal,
    required Money couponDiscount,
    required Money referralDiscount,
    required Money walletBalance,
    required bool useWallet,
  }) => CheckoutQuote.calculate(
    subtotal: subtotal,
    couponDiscount: couponDiscount,
    referralDiscount: referralDiscount,
    walletBalance: walletBalance,
    useWallet: useWallet,
  );
}
