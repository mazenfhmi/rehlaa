// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picked_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PickedFile _$PickedFileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PickedFile', json, ($checkedConvert) {
      final val = _PickedFile(
        path: $checkedConvert('path', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        mimeType: $checkedConvert('mimeType', (v) => v as String),
        sizeBytes: $checkedConvert('sizeBytes', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PickedFileToJson(_PickedFile instance) =>
    <String, dynamic>{
      'path': instance.path,
      'name': instance.name,
      'mimeType': instance.mimeType,
      'sizeBytes': instance.sizeBytes,
    };
