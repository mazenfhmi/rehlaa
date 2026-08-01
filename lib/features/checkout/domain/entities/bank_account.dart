import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account.freezed.dart';
part 'bank_account.g.dart';

@freezed
abstract class BankAccount with _$BankAccount {
  const factory BankAccount({
    required String id,
    required String bankId,
    required String beneficiaryNameAr,
    required String beneficiaryNameEn,
    required String accountNumber,
    required String instructionsAr,
    required String instructionsEn,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}
