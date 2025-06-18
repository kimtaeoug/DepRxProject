// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskItemModelImpl _$$TaskItemModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskItemModelImpl(
      taskName: json['taskName'] as String? ?? '',
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskItemModelImplToJson(_$TaskItemModelImpl instance) =>
    <String, dynamic>{
      'taskName': instance.taskName,
      'done': instance.done,
    };
