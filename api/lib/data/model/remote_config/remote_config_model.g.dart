// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigModelImpl _$$RemoteConfigModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteConfigModelImpl(
      serverInspectionTime: json['serverInspectionTime'] as String? ?? '',
      updateForce: json['updateForce'] as bool? ?? false,
      isClinical: json['isClinical'] as bool? ?? false,
      version: json['version'] as String? ?? '',
    );

Map<String, dynamic> _$$RemoteConfigModelImplToJson(
        _$RemoteConfigModelImpl instance) =>
    <String, dynamic>{
      'serverInspectionTime': instance.serverInspectionTime,
      'updateForce': instance.updateForce,
      'isClinical': instance.isClinical,
      'version': instance.version,
    };
