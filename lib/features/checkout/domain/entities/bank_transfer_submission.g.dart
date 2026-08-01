// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_transfer_submission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankTransferSubmission _$BankTransferSubmissionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BankTransferSubmission', json, ($checkedConvert) {
  final val = _BankTransferSubmission(
    referenceId: $checkedConvert('referenceId', (v) => v as String),
    bankId: $checkedConvert('bankId', (v) => v as String),
    operationNumber: $checkedConvert('operationNumber', (v) => v as String),
    receiptFilePath: $checkedConvert('receiptFilePath', (v) => v as String),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$BankTransferStatusEnumMap, v),
    ),
    submittedAt: $checkedConvert(
      'submittedAt',
      (v) => DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$BankTransferSubmissionToJson(
  _BankTransferSubmission instance,
) => <String, dynamic>{
  'referenceId': instance.referenceId,
  'bankId': instance.bankId,
  'operationNumber': instance.operationNumber,
  'receiptFilePath': instance.receiptFilePath,
  'status': _$BankTransferStatusEnumMap[instance.status]!,
  'submittedAt': instance.submittedAt.toIso8601String(),
};

const _$BankTransferStatusEnumMap = {
  BankTransferStatus.pendingReview: 'pendingReview',
  BankTransferStatus.approved: 'approved',
  BankTransferStatus.rejected: 'rejected',
};
