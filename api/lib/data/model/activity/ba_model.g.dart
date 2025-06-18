// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ba_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BAModelImpl _$$BAModelImplFromJson(Map<String, dynamic> json) =>
    _$BAModelImpl(
      date: json['date'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      contents: json['contents'] as String? ?? '',
      done: json['done'] as bool? ?? false,
      category: json['category'] as String? ?? '',
      activityId: json['activityId'] as String? ?? '',
    );

Map<String, dynamic> _$$BAModelImplToJson(_$BAModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'imagePath': instance.imagePath,
      'contents': instance.contents,
      'done': instance.done,
      'category': instance.category,
      'activityId': instance.activityId,
    };
