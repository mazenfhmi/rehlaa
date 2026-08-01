import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_transfer_submission.freezed.dart';
part 'bank_transfer_submission.g.dart';

enum BankTransferStatus { pendingReview, approved, rejected }

@freezed
abstract class BankTransferSubmission with _$BankTransferSubmission {
  const factory BankTransferSubmission({
    required String referenceId,
    required String bankId,
    required String operationNumber,
    required String receiptFilePath,
    required BankTransferStatus status,
    required DateTime submittedAt,
  }) = _BankTransferSubmission;

  factory BankTransferSubmission.fromJson(Map<String, dynamic> json) =>
      _$BankTransferSubmissionFromJson(json);
}
