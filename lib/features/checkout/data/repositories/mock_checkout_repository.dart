import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/checkout/data/mock/checkout_mock_data.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank_account.dart';
import 'package:rehlaa/features/checkout/domain/entities/checkout_quote.dart';
import 'package:rehlaa/features/checkout/domain/entities/payment_method.dart';
import 'package:rehlaa/features/checkout/domain/repositories/checkout_repository.dart';

class MockCheckoutRepository implements CheckoutRepository {
  MockCheckoutRepository({this.delay = const Duration(milliseconds: 500)});

  final Duration delay;

  @override
  Future<Result<List<PaymentMethod>>> getPaymentMethods() async {
    await Future<void>.delayed(delay);
    return const Success(CheckoutMockData.paymentMethods);
  }

  @override
  Future<Result<List<Bank>>> getBanks() async {
    await Future<void>.delayed(delay);
    return const Success(CheckoutMockData.banks);
  }

  @override
  Future<Result<BankAccount>> getBankAccount(String bankId) async {
    await Future<void>.delayed(delay);
    final account = CheckoutMockData.bankAccounts
        .where((acc) => acc.bankId == bankId)
        .firstOrNull;

    if (account != null) {
      return Success(account);
    }
    return const Failure(NotFoundFailure(message: 'Bank account not found.'));
  }

  @override
  Future<Result<void>> submitBankTransfer({
    required CheckoutQuote quote,
    required String bankId,
    required String operationNumber,
    required String receiptFilePath,
  }) async {
    await Future<void>.delayed(delay);
    return const Success(
      null,
    ); // Just simulating a successful API call. The ViewModel will manage the BankTransferSubmission entity.
  }

  @override
  Future<Result<void>> submitOrder({
    required CheckoutQuote quote,
    required String paymentMethodId,
  }) async {
    await Future<void>.delayed(delay);
    return const Success(null);
  }
}

final checkoutRepositoryProvider = Provider<CheckoutRepository>(
  (ref) => MockCheckoutRepository(),
);
