import 'package:rehlaa/core/network/connectivity_service.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/checkout/data/repositories/mock_checkout_repository.dart';
import 'package:rehlaa/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:rehlaa/features/checkout/domain/use_cases/apply_promotion.dart';
import 'package:rehlaa/features/checkout/domain/use_cases/build_checkout_quote.dart';
import 'package:rehlaa/features/checkout/presentation/states/checkout_state.dart';
import 'package:rehlaa/shared/domain/money/money.dart';
import 'package:rehlaa/core/files/picked_file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout_view_model.g.dart';

@riverpod
class CheckoutViewModel extends _$CheckoutViewModel {
  late final CheckoutRepository _repository;
  late final ConnectivityService _connectivityService;
  late final BuildCheckoutQuote _buildCheckoutQuote;
  late final ApplyPromotion _applyPromotion;
  late final Money _walletBalance;

  @override
  CheckoutState build(Money subtotal) {
    _repository = ref.read(checkoutRepositoryProvider);
    _connectivityService = ref.read(connectivityServiceProvider);
    _buildCheckoutQuote = BuildCheckoutQuote();
    _applyPromotion = ApplyPromotion();
    _walletBalance = const Money.sdg(5000000); // 50,000 SDG

    // Trigger initial load but don't await (build must be sync since we return CheckoutState, not Future<CheckoutState>)
    Future.microtask(() => _loadInitialData());

    return const CheckoutState();
  }

  Future<void> _loadInitialData() async {
    state = state.copyWith(isLoading: true);
    
    _recalculateQuote();

    final methodsResult = await _repository.getPaymentMethods();
    final banksResult = await _repository.getBanks();

    state = state.copyWith(
      isLoading: false,
      paymentMethods: methodsResult.isSuccess ? methodsResult.dataOrThrow : [],
      banks: banksResult.isSuccess ? banksResult.dataOrThrow : [],
    );
  }

  void _recalculateQuote() {
    Money couponDiscount = const Money.sdg(0);
    Money referralDiscount = const Money.sdg(0);

    if (state.couponCode.isNotEmpty && state.couponError == null) {
      final couponRes = _applyPromotion(code: state.couponCode);
      if (couponRes.isSuccess) {
        couponDiscount = couponRes.dataOrThrow;
      }
    }

    if (state.referralCode.isNotEmpty && state.referralError == null) {
      final referralRes = _applyPromotion(code: state.referralCode);
      if (referralRes.isSuccess) {
        referralDiscount = referralRes.dataOrThrow;
      }
    }

    final newQuote = _buildCheckoutQuote(
      subtotal: subtotal,
      couponDiscount: couponDiscount,
      referralDiscount: referralDiscount,
      walletBalance: _walletBalance,
      useWallet: state.useWallet,
    );

    state = state.copyWith(quote: newQuote);
  }

  void applyCoupon(String code) {
    if (code.trim().isEmpty) {
      state = state.copyWith(couponCode: '', couponError: null);
      _recalculateQuote();
      return;
    }

    final result = _applyPromotion(code: code);
    if (result.isSuccess) {
      state = state.copyWith(couponCode: code, couponError: null);
    } else {
      state = state.copyWith(couponError: (result as Failure).failure.message);
    }
    _recalculateQuote();
  }

  void applyReferral(String code) {
    if (code.trim().isEmpty) {
      state = state.copyWith(referralCode: '', referralError: null);
      _recalculateQuote();
      return;
    }

    final result = _applyPromotion(code: code);
    if (result.isSuccess) {
      state = state.copyWith(referralCode: code, referralError: null);
    } else {
      state = state.copyWith(referralError: (result as Failure).failure.message);
    }
    _recalculateQuote();
  }

  void toggleWallet() {
    state = state.copyWith(useWallet: !state.useWallet);
    _recalculateQuote();
  }

  void selectPaymentMethod(String id) {
    final method = state.paymentMethods.where((m) => m.id == id).firstOrNull;
    state = state.copyWith(selectedPaymentMethod: method);
  }

  Future<void> selectBank(String id) async {
    final bank = state.banks.where((b) => b.id == id).firstOrNull;
    state = state.copyWith(selectedBank: bank, bankAccount: null);
    
    if (bank != null) {
      final accountResult = await _repository.getBankAccount(bank.id);
      if (accountResult.isSuccess) {
        state = state.copyWith(bankAccount: accountResult.dataOrThrow);
      }
    }
  }

  void setOperationNumber(String number) {
    state = state.copyWith(operationNumber: number);
  }

  void setReceipt(PickedFile file) {
    state = state.copyWith(receiptFile: file);
  }

  Future<void> submit() async {
    if (!state.canSubmit) return;

    final isConnected = await _connectivityService.isConnected;
    if (!isConnected) {
      state = state.copyWith(isOffline: true, submissionError: 'لا يوجد اتصال بالإنترنت.');
      return;
    }

    state = state.copyWith(isSubmitting: true, isOffline: false, submissionError: null);

    if (state.selectedPaymentMethod!.isBankTransfer) {
      final result = await _repository.submitBankTransfer(
        quote: state.quote!,
        bankId: state.selectedBank!.id,
        operationNumber: state.operationNumber,
        receiptFilePath: state.receiptFile!.path,
      );

      state = state.copyWith(
        isSubmitting: false,
        isSuccess: result.isSuccess,
        submissionError: result.isFailure ? (result as Failure).failure.message : null,
      );
    } else {
      final result = await _repository.submitOrder(
        quote: state.quote!,
        paymentMethodId: state.selectedPaymentMethod!.id,
      );

      state = state.copyWith(
        isSubmitting: false,
        isSuccess: result.isSuccess,
        submissionError: result.isFailure ? (result as Failure).failure.message : null,
      );
    }
  }
}
