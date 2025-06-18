// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdui_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SDUIItemModelImpl _$$SDUIItemModelImplFromJson(Map<String, dynamic> json) =>
    _$SDUIItemModelImpl(
      number: (json['number'] as num?)?.toInt() ?? 0,
      keyword: json['keyword'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  SDUIItemDetailModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SDUIItemModelImplToJson(_$SDUIItemModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'keyword': instance.keyword,
      'data': instance.data,
    };
