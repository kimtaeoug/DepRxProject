// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirebaseOptionModelImpl _$$FirebaseOptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseOptionModelImpl(
      project_info: json['project_info'] == null
          ? const FBProjectInfoModel()
          : FBProjectInfoModel.fromJson(
              json['project_info'] as Map<String, dynamic>),
      client: (json['client'] as List<dynamic>?)
              ?.map((e) => FBClientModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      configuration_version: json['configuration_version'] as String? ?? '',
    );

Map<String, dynamic> _$$FirebaseOptionModelImplToJson(
        _$FirebaseOptionModelImpl instance) =>
    <String, dynamic>{
      'project_info': instance.project_info,
      'client': instance.client,
      'configuration_version': instance.configuration_version,
    };
