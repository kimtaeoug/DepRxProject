// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryModelImpl _$$DiaryModelImplFromJson(Map<String, dynamic> json) =>
    _$DiaryModelImpl(
      date: json['date'] as String? ?? '',
      contents: json['contents'] as String? ?? '',
    );

Map<String, dynamic> _$$DiaryModelImplToJson(_$DiaryModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'contents': instance.contents,
    };
