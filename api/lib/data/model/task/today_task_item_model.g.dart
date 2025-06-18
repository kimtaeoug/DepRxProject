// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_task_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodayTaskItemModelImpl _$$TodayTaskItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayTaskItemModelImpl(
      date: json['date'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      contents: json['contents'] as String? ?? '',
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodayTaskItemModelImplToJson(
        _$TodayTaskItemModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'imagePath': instance.imagePath,
      'contents': instance.contents,
      'done': instance.done,
    };
