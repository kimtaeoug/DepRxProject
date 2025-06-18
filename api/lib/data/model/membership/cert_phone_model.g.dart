// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cert_phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CertPhoneModelImpl _$$CertPhoneModelImplFromJson(Map<String, dynamic> json) =>
    _$CertPhoneModelImpl(
      number: json['number'] as String? ?? '',
      expiredTime: json['expiredTime'] as String? ?? '',
    );

Map<String, dynamic> _$$CertPhoneModelImplToJson(
        _$CertPhoneModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'expiredTime': instance.expiredTime,
    };
