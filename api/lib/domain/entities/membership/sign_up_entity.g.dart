// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpEntityImpl _$$SignUpEntityImplFromJson(Map<String, dynamic> json) =>
    _$SignUpEntityImpl(
      code: json['code'] as String? ?? '',
      id: json['id'] as String? ?? '',
      password: json['password'] as String? ?? '',
      marketing: json['marketing'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      birth: json['birth'] as String? ?? '',
      mainAddress: json['mainAddress'] as String? ?? '',
      detailAddress: json['detailAddress'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$SignUpEntityImplToJson(_$SignUpEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'password': instance.password,
      'marketing': instance.marketing,
      'name': instance.name,
      'gender': instance.gender,
      'birth': instance.birth,
      'mainAddress': instance.mainAddress,
      'detailAddress': instance.detailAddress,
      'phoneNumber': instance.phoneNumber,
    };
