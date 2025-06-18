// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fb_project_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FBProjectInfoModelImpl _$$FBProjectInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FBProjectInfoModelImpl(
      project_number: json['project_number'] as String? ?? '',
      project_id: json['project_id'] as String? ?? '',
      storage_bucket: json['storage_bucket'] as String? ?? '',
    );

Map<String, dynamic> _$$FBProjectInfoModelImplToJson(
        _$FBProjectInfoModelImpl instance) =>
    <String, dynamic>{
      'project_number': instance.project_number,
      'project_id': instance.project_id,
      'storage_bucket': instance.storage_bucket,
    };
