// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_signup_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialSignupEntityImpl _$$SocialSignupEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialSignupEntityImpl(
      code: json['code'] as String? ?? '',
      socialsUuid: json['socialsUuid'] as String? ?? '',
      socialsType: json['socialsType'] as String? ?? '',
      marketing: json['marketing'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      birth: json['birth'] as String? ?? '',
      mainAddress: json['mainAddress'] as String? ?? '',
      detailAddress: json['detailAddress'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$SocialSignupEntityImplToJson(
        _$SocialSignupEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'socialsUuid': instance.socialsUuid,
      'socialsType': instance.socialsType,
      'marketing': instance.marketing,
      'name': instance.name,
      'gender': instance.gender,
      'birth': instance.birth,
      'mainAddress': instance.mainAddress,
      'detailAddress': instance.detailAddress,
      'phoneNumber': instance.phoneNumber,
    };
