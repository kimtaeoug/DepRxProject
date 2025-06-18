// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recognize_me_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecognizeMeDataEntityImpl _$$RecognizeMeDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RecognizeMeDataEntityImpl(
      title: json['title'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  RecognizeMeItemEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RecognizeMeDataEntityImplToJson(
        _$RecognizeMeDataEntityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'data': instance.data,
    };
