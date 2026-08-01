// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankAccount _$BankAccountFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BankAccount', json, ($checkedConvert) {
  final val = _BankAccount(
    id: $checkedConvert('id', (v) => v as String),
    bankId: $checkedConvert('bankId', (v) => v as String),
    beneficiaryNameAr: $checkedConvert('beneficiaryNameAr', (v) => v as String),
    beneficiaryNameEn: $checkedConvert('beneficiaryNameEn', (v) => v as String),
    accountNumber: $checkedConvert('accountNumber', (v) => v as String),
    instructionsAr: $checkedConvert('instructionsAr', (v) => v as String),
    instructionsEn: $checkedConvert('instructionsEn', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$BankAccountToJson(_BankAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankId': instance.bankId,
      'beneficiaryNameAr': instance.beneficiaryNameAr,
      'beneficiaryNameEn': instance.beneficiaryNameEn,
      'accountNumber': instance.accountNumber,
      'instructionsAr': instance.instructionsAr,
      'instructionsEn': instance.instructionsEn,
    };
