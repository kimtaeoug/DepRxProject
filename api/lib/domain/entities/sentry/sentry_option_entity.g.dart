// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentry_option_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SentryOptionEntityImpl _$$SentryOptionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SentryOptionEntityImpl(
      service: json['service'] as String? ?? '',
      release: json['release'] as String? ?? '',
      os: json['os'] as String? ?? '',
      network: json['network'] as String? ?? '',
      endpoint: json['endpoint'] as String? ?? '',
      statusCode: json['statusCode'] as String? ?? '',
      method: json['method'] as String? ?? '',
      apiVersion: json['apiVersion'] as String? ?? '',
    );

Map<String, dynamic> _$$SentryOptionEntityImplToJson(
        _$SentryOptionEntityImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'release': instance.release,
      'os': instance.os,
      'network': instance.network,
      'endpoint': instance.endpoint,
      'statusCode': instance.statusCode,
      'method': instance.method,
      'apiVersion': instance.apiVersion,
    };
