// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefaultResponseModelImpl _$$DefaultResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DefaultResponseModelImpl(
      json['errorCode'] as String,
      json['msg'] as String,
      json['data'],
    );

Map<String, dynamic> _$$DefaultResponseModelImplToJson(
        _$DefaultResponseModelImpl instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'msg': instance.msg,
      'data': instance.data,
    };
