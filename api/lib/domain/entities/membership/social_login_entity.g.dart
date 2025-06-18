// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialLoginEntityImpl _$$SocialLoginEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialLoginEntityImpl(
      socialsUuid: json['socialsUuid'] as String? ?? '',
      socialsType: json['socialsType'] as String? ?? '',
      force: json['force'] as bool? ?? false,
      fcmToken: json['fcmToken'] as String? ?? '',
    );

Map<String, dynamic> _$$SocialLoginEntityImplToJson(
        _$SocialLoginEntityImpl instance) =>
    <String, dynamic>{
      'socialsUuid': instance.socialsUuid,
      'socialsType': instance.socialsType,
      'force': instance.force,
      'fcmToken': instance.fcmToken,
    };
