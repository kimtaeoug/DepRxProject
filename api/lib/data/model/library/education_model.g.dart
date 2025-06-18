// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationModelImpl _$$EducationModelImplFromJson(Map<String, dynamic> json) =>
    _$EducationModelImpl(
      educationList: (json['educationList'] as List<dynamic>?)
              ?.map(
                  (e) => EducationItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EducationModelImplToJson(
        _$EducationModelImpl instance) =>
    <String, dynamic>{
      'educationList': instance.educationList,
    };
