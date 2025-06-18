// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationItemModelImpl _$$EducationItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EducationItemModelImpl(
      week: (json['week'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      videoPath: json['videoPath'] as String? ?? '',
      description: (json['description'] as List<dynamic>?)
              ?.map((e) =>
                  EducationDescItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      thumbNailPath: json['thumbNailPath'] as String? ?? '',
      time: json['time'] as String? ?? '',
    );

Map<String, dynamic> _$$EducationItemModelImplToJson(
        _$EducationItemModelImpl instance) =>
    <String, dynamic>{
      'week': instance.week,
      'title': instance.title,
      'videoPath': instance.videoPath,
      'description': instance.description,
      'thumbNailPath': instance.thumbNailPath,
      'time': instance.time,
    };
