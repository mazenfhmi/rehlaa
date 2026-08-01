// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AuthUser', json, ($checkedConvert) {
      final val = _AuthUser(
        id: $checkedConvert('id', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
        displayName: $checkedConvert('displayName', (v) => v as String),
        photoUrl: $checkedConvert('photoUrl', (v) => v as String?),
        phoneNumber: $checkedConvert('phoneNumber', (v) => v as String?),
        isEmailVerified: $checkedConvert(
          'isEmailVerified',
          (v) => v as bool? ?? false,
        ),
      );
      return val;
    });

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'displayName': instance.displayName,
  'photoUrl': ?instance.photoUrl,
  'phoneNumber': ?instance.phoneNumber,
  'isEmailVerified': instance.isEmailVerified,
};
