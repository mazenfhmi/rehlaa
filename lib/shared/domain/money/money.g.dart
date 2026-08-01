// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Money _$MoneyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Money', json, ($checkedConvert) {
      final val = Money(
        currencyCode: $checkedConvert('currencyCode', (v) => v as String),
        minorUnits: $checkedConvert('minorUnits', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$MoneyToJson(Money instance) => <String, dynamic>{
  'currencyCode': instance.currencyCode,
  'minorUnits': instance.minorUnits,
};
