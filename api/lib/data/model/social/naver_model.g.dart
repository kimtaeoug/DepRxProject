// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NaverModelImpl _$$NaverModelImplFromJson(Map<String, dynamic> json) =>
    _$NaverModelImpl(
      code: json['code'] as String? ?? '',
      state: json['state'] as String? ?? '',
      error: json['error'] as String? ?? '',
      error_description: json['error_description'] as String? ?? '',
    );

Map<String, dynamic> _$$NaverModelImplToJson(_$NaverModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'state': instance.state,
      'error': instance.error,
      'error_description': instance.error_description,
    };
