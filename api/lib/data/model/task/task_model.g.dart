// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      week: (json['week'] as num?)?.toInt() ?? 0,
      day: (json['day'] as num?)?.toInt() ?? 0,
      taskList: (json['taskList'] as List<dynamic>?)
              ?.map((e) => TaskItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'day': instance.day,
      'taskList': instance.taskList,
    };
