import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'money.g.dart';

@JsonSerializable()
@immutable
class Money {
  final String currencyCode;
  final int minorUnits;

  const Money({
    required this.currencyCode,
    required this.minorUnits,
  });

  const Money.sdg(this.minorUnits) : currencyCode = 'SDG';

  factory Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);
  Map<String, dynamic> toJson() => _$MoneyToJson(this);

  Money operator +(Money other) {
    if (currencyCode != other.currencyCode) {
      throw StateError('Cannot add amounts with different currencies');
    }
    return Money(
      currencyCode: currencyCode,
      minorUnits: minorUnits + other.minorUnits,
    );
  }

  Money operator -(Money other) {
    if (currencyCode != other.currencyCode) {
      throw StateError('Cannot subtract amounts with different currencies');
    }
    return Money(
      currencyCode: currencyCode,
      minorUnits: minorUnits - other.minorUnits,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Money &&
          runtimeType == other.runtimeType &&
          currencyCode == other.currencyCode &&
          minorUnits == other.minorUnits;

  @override
  int get hashCode => currencyCode.hashCode ^ minorUnits.hashCode;
}
