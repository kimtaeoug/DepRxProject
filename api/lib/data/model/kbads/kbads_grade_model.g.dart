// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kbads_grade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KbadsGradeModelImpl _$$KbadsGradeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KbadsGradeModelImpl(
      min: (json['min'] as num?)?.toInt() ?? -1,
      max: (json['max'] as num?)?.toInt() ?? -1,
      represent: json['represent'] as String? ?? '',
      decrease: (json['decrease'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      same:
          (json['same'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      increase: (json['increase'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$KbadsGradeModelImplToJson(
        _$KbadsGradeModelImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'represent': instance.represent,
      'decrease': instance.decrease,
      'same': instance.same,
      'increase': instance.increase,
    };
