// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_login_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NaverLoginResponseEntityImpl _$$NaverLoginResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$NaverLoginResponseEntityImpl(
      code: json['code'] as String? ?? '',
      message: json['message'] as String? ?? '',
      response: json['response'] as String? ?? '',
    );

Map<String, dynamic> _$$NaverLoginResponseEntityImplToJson(
        _$NaverLoginResponseEntityImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'response': instance.response,
    };
