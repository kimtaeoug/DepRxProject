// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcedureModelImpl _$$ProcedureModelImplFromJson(Map<String, dynamic> json) =>
    _$ProcedureModelImpl(
      accessToken: json['accessToken'] as String? ?? '',
      name: json['name'] as String? ?? '',
      round: (json['round'] as num?)?.toInt() ?? 1,
      week: (json['week'] as num?)?.toInt() ?? 0,
      sequence: json['sequence'] as String? ?? '',
    );

Map<String, dynamic> _$$ProcedureModelImplToJson(
        _$ProcedureModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'name': instance.name,
      'round': instance.round,
      'week': instance.week,
      'sequence': instance.sequence,
    };
