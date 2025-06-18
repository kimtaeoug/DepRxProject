// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginEntityImpl _$$LoginEntityImplFromJson(Map<String, dynamic> json) =>
    _$LoginEntityImpl(
      id: json['id'] as String? ?? '',
      password: json['password'] as String? ?? '',
      force: json['force'] as bool? ?? false,
      fcmToken: json['fcmToken'] as String? ?? '',
    );

Map<String, dynamic> _$$LoginEntityImplToJson(_$LoginEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'force': instance.force,
      'fcmToken': instance.fcmToken,
    };
