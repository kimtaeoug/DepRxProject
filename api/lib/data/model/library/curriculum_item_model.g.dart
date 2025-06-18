// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurriculumItemModelImpl _$$CurriculumItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurriculumItemModelImpl(
      idx: (json['idx'] as num?)?.toInt() ?? 0,
      weeklyTitle: json['weeklyTitle'] as String? ?? '',
      goal: json['goal'] as String? ?? '',
      detail: (json['detail'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CurriculumItemModelImplToJson(
        _$CurriculumItemModelImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'weeklyTitle': instance.weeklyTitle,
      'goal': instance.goal,
      'detail': instance.detail,
    };
