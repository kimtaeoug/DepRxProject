// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recognize_me_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecognizeMeItemEntityImpl _$$RecognizeMeItemEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RecognizeMeItemEntityImpl(
      idx: (json['idx'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      hint: json['hint'] as String? ?? '',
    );

Map<String, dynamic> _$$RecognizeMeItemEntityImplToJson(
        _$RecognizeMeItemEntityImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'title': instance.title,
      'hint': instance.hint,
    };
