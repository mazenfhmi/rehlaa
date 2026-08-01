import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed
abstract class Bank with _$Bank {
  const factory Bank({
    required String id,
    required String nameAr,
    required String nameEn,
    required String logoUrl,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}
