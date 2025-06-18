// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_desc_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EducationDescItemModelImpl _$$EducationDescItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EducationDescItemModelImpl(
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      contents: (json['contents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      strong: (json['strong'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      week: json['week'] as String? ?? '',
      img: (json['img'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$EducationDescItemModelImplToJson(
        _$EducationDescItemModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'contents': instance.contents,
      'strong': instance.strong,
      'week': instance.week,
      'img': instance.img,
    };
