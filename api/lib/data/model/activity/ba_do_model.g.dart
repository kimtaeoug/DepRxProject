// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ba_do_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BADoModelImpl _$$BADoModelImplFromJson(Map<String, dynamic> json) =>
    _$BADoModelImpl(
      activityId: json['activityId'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      category: json['category'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
    );

Map<String, dynamic> _$$BADoModelImplToJson(_$BADoModelImpl instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
      'imagePath': instance.imagePath,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'subtitle': instance.subtitle,
    };
