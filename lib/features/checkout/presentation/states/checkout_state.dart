import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlaa/core/files/picked_file.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank_account.dart';
import 'package:rehlaa/features/checkout/domain/entities/checkout_quote.dart';
import 'package:rehlaa/features/checkout/domain/entities/payment_method.dart';

part 'checkout_state.freezed.dart';

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default(false) bool isOffline,
    CheckoutQuote? quote,
    @Default([]) List<PaymentMethod> paymentMethods,
    PaymentMethod? selectedPaymentMethod,
    @Default([]) List<Bank> banks,
    Bank? selectedBank,
    BankAccount? bankAccount,
    @Default('') String operationNumber,
    PickedFile? receiptFile,
    @Default('') String couponCode,
    @Default('') String referralCode,
    @Default(false) bool useWallet,
    String? couponError,
    String? referralError,
    String? submissionError,
    @Default(false) bool isSuccess,
  }) = _CheckoutState;

  const CheckoutState._();

  bool get canSubmit {
    if (quote == null || selectedPaymentMethod == null) return false;

    // For bank transfers
    if (selectedPaymentMethod!.isBankTransfer) {
      if (selectedBank == null ||
          operationNumber.trim().isEmpty ||
          receiptFile == null) {
        return false;
      }
    }

    return true;
  }
}
