// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdui_item_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SDUIItemDetailModelImpl _$$SDUIItemDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SDUIItemDetailModelImpl(
      title: json['title'] as String? ?? '',
      selection: (json['selection'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      type: json['type'] as String? ?? '',
      strongTitle: json['strongTitle'] as String? ?? '',
    );

Map<String, dynamic> _$$SDUIItemDetailModelImplToJson(
        _$SDUIItemDetailModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'selection': instance.selection,
      'type': instance.type,
      'strongTitle': instance.strongTitle,
    };
