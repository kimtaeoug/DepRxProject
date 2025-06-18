// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurriculumModelImpl _$$CurriculumModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurriculumModelImpl(
      (json['list'] as List<dynamic>)
          .map((e) => CurriculumItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurriculumModelImplToJson(
        _$CurriculumModelImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
