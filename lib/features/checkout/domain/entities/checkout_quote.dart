import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/shared/domain/money/money.dart';

part 'checkout_quote.freezed.dart';
part 'checkout_quote.g.dart';

@freezed
abstract class CheckoutQuote with _$CheckoutQuote {
  const factory CheckoutQuote({
    required Money subtotal,
    required Money couponDiscount,
    required Money referralDiscount,
    required Money walletApplied,
    required Money externalPayable,
    required Money grandTotal,
  }) = _CheckoutQuote;
  const CheckoutQuote._();

  /// Deterministically builds a quote ensuring invariants are maintained.
  /// Deductions are applied in order: coupon -> referral -> wallet.
  /// The payable amount never drops below 0.
  factory CheckoutQuote.calculate({
    required Money subtotal,
    required Money couponDiscount,
    required Money referralDiscount,
    required Money walletBalance,
    required bool useWallet,
  }) {
    var current = subtotal.minorUnits;

    // Apply coupon
    var couponDeduction = couponDiscount.minorUnits;
    if (couponDeduction > current) couponDeduction = current;
    current -= couponDeduction;

    // Apply referral
    var referralDeduction = referralDiscount.minorUnits;
    if (referralDeduction > current) referralDeduction = current;
    current -= referralDeduction;

    // Apply wallet
    var walletDeduction = 0;
    if (useWallet) {
      walletDeduction = walletBalance.minorUnits;
      if (walletDeduction > current) walletDeduction = current;
    }
    current -= walletDeduction;

    // The remaining amount is what needs to be paid via external payment method
    var payable = current;
    if (payable < 0) payable = 0;

    return CheckoutQuote(
      subtotal: subtotal,
      couponDiscount: Money.sdg(couponDeduction),
      referralDiscount: Money.sdg(referralDeduction),
      walletApplied: Money.sdg(walletDeduction),
      externalPayable: Money.sdg(payable),
      grandTotal:
          subtotal, // Grand total is always the original subtotal before discounts
    );
  }

  factory CheckoutQuote.fromJson(Map<String, dynamic> json) =>
      _$CheckoutQuoteFromJson(json);
}
