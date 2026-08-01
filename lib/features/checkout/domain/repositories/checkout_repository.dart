import 'package:rehlaa/core/result/result.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank.dart';
import 'package:rehlaa/features/checkout/domain/entities/bank_account.dart';
import 'package:rehlaa/features/checkout/domain/entities/checkout_quote.dart';
import 'package:rehlaa/features/checkout/domain/entities/payment_method.dart';

abstract class CheckoutRepository {
  Future<Result<List<PaymentMethod>>> getPaymentMethods();
  Future<Result<List<Bank>>> getBanks();
  Future<Result<BankAccount>> getBankAccount(String bankId);
  Future<Result<void>> submitBankTransfer({
    required CheckoutQuote quote,
    required String bankId,
    required String operationNumber,
    required String receiptFilePath,
  });
  Future<Result<void>> submitOrder({
    required CheckoutQuote quote,
    required String paymentMethodId,
  });
}
